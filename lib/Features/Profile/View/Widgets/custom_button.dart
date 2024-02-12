import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: AppColors.kPrimaryColor,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height*0.014,
            horizontal: MediaQuery.of(context).size.width*0.40)
        ),
        child: Text(
          text,
          style: Styels.textStyle18_600(context).copyWith(fontWeight: FontWeight.w700,color: Colors.white),
        ),
      ),
    );
  }
}
