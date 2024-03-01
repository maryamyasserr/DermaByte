import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class ScanProgressContainer extends StatelessWidget {
  const ScanProgressContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kWhiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Scan in progress',
                          textAlign: TextAlign.center,
                          style: Styels.textStyle18_600(context)
                              .copyWith(fontSize: 25),
                        ),
                        const SizedBox(height: 16),
                        const CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
