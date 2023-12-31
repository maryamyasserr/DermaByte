import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key, required this.horizontal, required this.textButton,required this.onPressed});
  final double horizontal;
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: AppColors.kPrimaryColor),
        child: Text(
          textButton,
          style: Styels.textStyle24_600
              .copyWith(fontSize: 20, color: Colors.white),
        ));
  }
}
