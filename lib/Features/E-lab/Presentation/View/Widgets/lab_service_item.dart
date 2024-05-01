import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LabServiceItem extends StatelessWidget {
  const LabServiceItem({
    super.key,
    required this.testName,
    required this.cost,
    required this.onTap,
    required this.selected,
  });
  final String testName, cost;
  final void Function() onTap;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: AppColors.kCardColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 2.6),
                  blurRadius: 6.0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.file_copy_rounded,
                      size: 40,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 80,
                      child: Text(
                        testName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styels.textStyle18_600(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Cost : ",
                          style: Styels.textStyle15_400(context),
                        ),
                        Text(
                          cost,
                          style: Styels.textStyle15_400(context),
                        ),
                      ],
                    ),
                    selected
                        ? const Center(
                            child: Icon(
                              Icons.check_box,
                              size: 34,
                              color: AppColors.kPrimaryColor,
                            ),
                          )
                        : const Center(
                            child: Icon(
                              Icons.check_box_outline_blank,
                              size: 34,
                              color: AppColors.kPrimaryColor,
                            ),
                          )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
