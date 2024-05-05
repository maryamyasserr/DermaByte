import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Add_Test_Result_Cubit/add_test_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AttachedField extends StatelessWidget {
  const AttachedField(
      {super.key,
      required this.title,
      required this.onTap,
      required this.index,
      required this.testName});
  final String title, testName;
  final int index;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    List<XFile>? uploadedTests =
        BlocProvider.of<AddTestResultCubit>(context).allUploadedTests[index];
    return BlocBuilder<AddTestResultCubit, AddTestResultState>(
      builder: (context, state) {
        if (uploadedTests.isEmpty) {
          return GestureDetector(
            onTap: onTap,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.07,
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
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
          );
        } else {
          return Column(
            children: [
              Column(
                  children: uploadedTests
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      e.name,
                                      style: Styels.textStyle20_200(context),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.download_done,
                                      color: Colors.green,
                                      size: 27,
                                    )
                                  ],
                                ),
                                GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<AddTestResultCubit>(
                                              context)
                                          .removeTestResult(testName,uploadedTests, e);
                                    },
                                    child: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                      size: 27,
                                    ))
                              ],
                            ),
                          ))
                      .toList()),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.07,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Addtional Tests",
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
          );
        }
      },
    );
  }
}
