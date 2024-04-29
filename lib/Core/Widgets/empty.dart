import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.hourglass_empty_outlined,
            color: AppColors.kPrimaryColor,
            size: 80,
          ),
          const SizedBox(height: 8),
          Text(text, style: Styels.textStyle18_400(context)),
        ],
      ),
    );
  }
}
