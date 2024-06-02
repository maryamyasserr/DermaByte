import 'package:dermabyte/Core/Widgets/confirmation_alert.dart';
import 'package:dermabyte/Core/Widgets/done_alert.dart';
import 'package:dermabyte/Core/Widgets/failed_alert.dart';
import 'package:dermabyte/Core/Widgets/loading_indicator.dart';
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
import 'package:go_router/go_router.dart';
import 'package:http_parser/http_parser.dart';

class RequestBody extends StatefulWidget {
  const RequestBody({super.key});

  @override
  State<RequestBody> createState() => _RequestBodyState();
}

class _RequestBodyState extends State<RequestBody> {
  @override
  void initState() {
    BlocProvider.of<LabHelperCubit>(context).results = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LabReservations reservation =
        BlocProvider.of<LabReservationsCubit>(context).currentReservation!;
    List<UploadedTestModel> allResults =
        BlocProvider.of<LabHelperCubit>(context).allResutls;
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
                Text(
                  "Requested tests",
                  style: Styels.textStyle24_600(context).copyWith(
                      fontSize: 28, decoration: TextDecoration.underline),
                ),
                const SizedBox(height: 12),
                const Uploaded(),
                const SizedBox(height: 50),
                BlocConsumer<AttachResultCubit, AttachResultState>(
                  listener: (context, state) {
                    if (state is AttachResultSuccess) {
                      showDoneAlert(context);
                    } else if (state is AttachResultFailure) {
                      failedAlert(context, state.errMessage);
                    }
                  },
                  builder: (context, state) {
                    return AttachButton(
                      isLoading:
                          BlocProvider.of<AttachResultCubit>(context).isLoading,
                      onPressed: () async {
                        BlocProvider.of<LabHelperCubit>(context).configData();
                        if (BlocProvider.of<LabHelperCubit>(context)
                                .allResutls
                                .isEmpty ||
                            reservation.test!.length >
                                BlocProvider.of<LabHelperCubit>(context)
                                    .allResutls
                                    .length) {
                          failedAlert(context, "Attach Test Result");
                        } else {
                          confirmationDialog(
                              context: context,
                              onPressed: () async {
                                GoRouter.of(context).pop();
                                FormData formData = FormData();
                                for (int i = 0; i < allResults.length; i++) {
                                  for (int j = 0;
                                      j < allResults[i].testsFiles.length;
                                      j++) {
                                    formData.files.add(
                                      MapEntry(
                                        allResults[i].testName,
                                        await MultipartFile.fromFile(
                                          allResults[i].testsFiles[j].path,
                                          filename: 'test Results$i.jpg',
                                          contentType:
                                              MediaType('image', 'jpeg'),
                                        ),
                                      ),
                                    );
                                  }
                                  formData.fields.add(MapEntry(
                                      "patient", reservation.patient!.id!));
                                }

                                await BlocProvider.of<AttachResultCubit>(
                                        context)
                                    .attachResult(
                                        context: context,
                                        token:
                                            BlocProvider.of<AuthCubit>(context)
                                                .labModel!
                                                .token,
                                        body: formData);
                                await BlocProvider.of<LabReservationsCubit>(
                                        context)
                                    .deleteRequest(
                                  id: reservation.id!,
                                  token: BlocProvider.of<AuthCubit>(context)
                                      .labModel!
                                      .token,
                                );

                                await BlocProvider.of<LabReservationsCubit>(
                                        context)
                                    .getLabRequests(
                                        token:
                                            BlocProvider.of<AuthCubit>(context)
                                                .labModel!
                                                .token);
                              });
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
