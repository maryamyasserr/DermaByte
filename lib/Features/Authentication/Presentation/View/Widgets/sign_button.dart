import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignButton extends StatelessWidget {
  final String buttonName;
  Function onClicked;
  SignButton({super.key, required this.buttonName, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.width * 0.35,
                vertical: mediaQuery.height * 0.015),
            backgroundColor: AppColors.kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
        onPressed: () {
          onClicked();
        },
        child: Text(buttonName,
            style: Styels.textStyle20_700(context)
                .copyWith(color: AppColors.kWhiteColor)));
  }
}
