import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';

import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/lab_reservations.dart';
import 'package:dermabyte/Features/Lab/Data/Models/uploadedTestModel.dart';

import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/patient_info.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/uploaded.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/patient_photo.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Attach%20Result/attach_result_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Helper/lab_helper_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Reservaions%20Cubit/lab_reservations_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class RequestBody extends StatefulWidget {
  const RequestBody({super.key});

  static List<UploadedTestModel> allTestResults = [];

  @override
  State<RequestBody> createState() => _RequestBodyState();
}

class _RequestBodyState extends State<RequestBody> {
  bool isExist(String name) {
    return RequestBody.allTestResults.any((test) => test.testName == name);
  }

  @override
  Widget build(BuildContext context) {
    LabReservations reservation =
        BlocProvider.of<LabReservationsCubit>(context).currentReservation!;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: ListView(
              children: [
                const SizedBox(height: 50),
                const PatientPhoto(radius: 40),
                const SizedBox(height: 30),
                PatientInfo(
                    info: 'Name : ',
                    data:
                        "${reservation.patient!.firstName!} ${reservation.patient!.lastName!}"),
                PatientInfo(
                    info: 'Age : ', data: '${reservation.patient!.age}'),
                PatientInfo(
                    info: 'Date : ',
                    data:
                        "${reservation.date!.day}/${reservation.date!.month}/${reservation.date!.year}"),
                const SizedBox(height: 16),
                const Divider(
                  thickness: 0.3,
                  color: Colors.black,
                ),
                Column(
                  children: reservation.test!.map((e) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.name!,
                          style: Styels.textStyle20_300(context),
                        ),
                        const SizedBox(height: 16),
                        isExist(e.name!) == true
                            ? Uploaded(
                                tests: RequestBody.allTestResults,
                                onTap: () {
                                  setState(() {});
                                  print(RequestBody.allTestResults);
                                },
                              )
                            : GestureDetector(
                                onTap: () async {
                                  final List<XFile> pickedFile =
                                      await ImagePicker().pickMultiImage();
                                  UploadedTestModel test = UploadedTestModel(
                                      testName: e.name!,
                                      testsFiles: pickedFile);
                                  RequestBody.allTestResults.add(test);
                                  setState(() {});
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColors.kCardColor,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 2.6),
                                          blurRadius: 6.0,
                                        )
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Attach Test Result",
                                          style:
                                              Styels.textStyle16_400(context),
                                        ),
                                        const Icon(
                                          Icons.add,
                                          size: 35,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 50),
                BlocConsumer<AttachResultCubit, AttachResultState>(
                  listener: (context, state) {
                    if (state is AttachResultSuccess) {
                      showSnackBar(context, "Done");
                    } else if (state is AttachResultFailure) {
                      failedAlert(context, state.errMessage);
                      print(state.errMessage);
                    }
                  },
                  builder: (context, state) {
                    return AttachButton(
                      isLoading:
                          BlocProvider.of<AttachResultCubit>(context).isLoading,
                      onPressed: () async {
                        BlocProvider.of<LabHelperCubit>(context)
                            .allTest(reservation.test!);
                        if (BlocProvider.of<LabHelperCubit>(context)
                                .allTests
                                .isEmpty ||
                            BlocProvider.of<LabHelperCubit>(context)
                                .allUploadedTests
                                .isEmpty) {
                          failedAlert(context, "Attach Test Result");
                        } else {
                          FormData formData = FormData();
                          for (int i = 0;
                              i < RequestBody.allTestResults.length;
                              i++) {
                            for (int j = 0;
                                j <
                                    RequestBody
                                        .allTestResults[i].testsFiles.length;
                                j++) {
                              formData.files.add(
                                MapEntry(
                                  RequestBody.allTestResults[i].testName,
                                  await MultipartFile.fromFile(
                                    RequestBody
                                        .allTestResults[i].testsFiles[j].path,
                                    filename: 'test Results$i.jpg',
                                    contentType: MediaType('image', 'jpeg'),
                                  ),
                                ),
                              );
                            }
                            formData.fields.add(
                              MapEntry("patient", reservation.patient!.id!)
                            );
                          }

                          print(formData.fields);
                          // print(formData.files);
                          await BlocProvider.of<AttachResultCubit>(context)
                              .attachResult(
                                  context: context,
                                  token: BlocProvider.of<AuthCubit>(context)
                                      .labModel!
                                      .token,
                                  body: formData
                                  );
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AttachButton extends StatelessWidget {
  const AttachButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });
  final void Function() onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: AppColors.kPrimaryColor,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          )),
      child: isLoading
          ? const LoadingIndicator(color: Colors.white)
          : Text(
              "Save",
              style: Styels.textStyle18_600(context)
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
            ),
    );
  }
}
