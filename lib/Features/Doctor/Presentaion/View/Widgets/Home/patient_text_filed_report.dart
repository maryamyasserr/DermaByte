import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class PatientTextFieldReport extends StatelessWidget {
  const PatientTextFieldReport(
      {super.key, required this.hintText, required this.maxLines, required this.controller});
  final String hintText;
  final int maxLines;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hintText,
              style: Styels.textStyle18_400(context)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            TextField(
              controller: controller,
              maxLines: maxLines,
              keyboardType: TextInputType.text,
              cursorColor: AppColors.kPrimaryColor,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ],
        ),
      ),
    );
  }
}
