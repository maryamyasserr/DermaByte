import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Lab/Data/Models/uploadedTestModel.dart';
import 'package:flutter/material.dart';

class Uploaded extends StatelessWidget {
  const Uploaded({super.key, required this.tests, this.onTap});
  final List<UploadedTestModel> tests;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tests.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          tests[index].testName,
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
                        onTap:onTap ,
                        child: const Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 27,
                        ))
                  ],
                ),
              )
            ],
          );
        });
  }
}
