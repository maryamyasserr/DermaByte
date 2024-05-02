import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Helper/lab_helper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileUpload extends StatelessWidget {
  const FileUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LabHelperCubit, LabHelperState>(
      builder: (context, state) {
        if (BlocProvider.of<LabHelperCubit>(context).testResults.isEmpty) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
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
                    "Attach test resutls",
                    style: Styels.textStyle16_400(context),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await BlocProvider.of<LabHelperCubit>(context)
                          .uploadResult();
                    },
                    child: const Icon(
                      Icons.add,
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Column(
            children: [
              GestureDetector(
                  onTap: () async {
                    await BlocProvider.of<LabHelperCubit>(context)
                        .uploadResult();
                  },
                  child: Column(
                    children: BlocProvider.of<LabHelperCubit>(context)
                        .testResults
                        .map((e) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Column(
                          children: [
                            // const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.file_copy),
                                    const SizedBox(width: 4),
                                    Text(
                                      e.name,
                                      style: Styels.textStyle20_700(context),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(
                                      Icons.done,
                                      color: Colors.green,
                                      size: 27,
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      BlocProvider.of<LabHelperCubit>(context)
                                          .removePhoto(e);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 27,
                                    )),
                              ],
                            ),
                            // AspectRatio(
                            //   aspectRatio: 346 / 350,
                            //   child: Image.file(
                            //     File(e.path),
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    }).toList(),
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 60,
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
                        "Additional resutls",
                        style: Styels.textStyle16_400(context),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await BlocProvider.of<LabHelperCubit>(context)
                              .uploadResult();
                        },
                        child: const Icon(
                          Icons.add,
                          size: 35,
                        ),
                      )
                    ],
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
