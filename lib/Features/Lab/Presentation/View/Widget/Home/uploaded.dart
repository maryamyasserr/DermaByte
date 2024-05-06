import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/lab_reservations.dart';
import 'package:dermabyte/Features/Lab/Data/Models/uploadedTestModel.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Helper/lab_helper_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Reservaions%20Cubit/lab_reservations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Uploaded extends StatelessWidget {
  const Uploaded({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    LabReservations reservation =
        BlocProvider.of<LabReservationsCubit>(context).currentReservation!;
    List<UploadedTestModel> results =
        BlocProvider.of<LabHelperCubit>(context).results;
    return BlocBuilder<LabHelperCubit, LabHelperState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reservation.test!.length,
          itemBuilder: (context, index) {
            UploadedTestModel testResult;
            if (results.isNotEmpty && index < results.length) {
              testResult = results[index];
            } else {
              testResult = UploadedTestModel(
                testName: reservation.test![index].name!,
                testsFiles: [],
              );
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reservation.test![index].name!,
                    style: Styels.textStyle24_600(context),
                  ),
                  const SizedBox(height: 16),
                  if (testResult.testsFiles.isNotEmpty)
                    Column(
                      children: testResult.testsFiles.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.58,
                                child: Text(
                                  e.name,
                                  style: Styels.textStyle20_300(context),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<LabHelperCubit>(context)
                                      .removeTestResult(testResult, e);
                                },
                                child: const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: 27,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      final List<XFile> pickedFile =
                          await ImagePicker().pickMultiImage();
                      UploadedTestModel test = UploadedTestModel(
                          testName: reservation.test![index].name!,
                          testsFiles: pickedFile);
                      BlocProvider.of<LabHelperCubit>(context)
                          .addTestResult(test);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 2.6),
                            blurRadius: 6.0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Attach Test Result",
                              style: Styels.textStyle16_400(context),
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
              ),
            );
          },
        );
      },
    );
  }
}
