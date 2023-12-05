import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class SignUpAsButton extends StatefulWidget {
  final String buttonName;
  final Function onClicked;

  const SignUpAsButton({Key? key, required this.buttonName, required this.onClicked})
      : super(key: key);

  @override
  State<SignUpAsButton> createState() => _SignUpAsButtonState();
}

class _SignUpAsButtonState extends State<SignUpAsButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: mediaQuery.width * 0.3,
          vertical: mediaQuery.height * 0.027,
        ),
        // backgroundColor: isClicked ? AppColors.kPrimaryColor : const Color(0xffE7E6F1),
        backgroundColor: AppColors.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onPressed: () {
        setState(() {
          isClicked = !isClicked;
        });
        Future.delayed(const Duration(milliseconds: 250), () {
          widget.onClicked();
        });
      },
      child: Text(
        widget.buttonName,
        style: Styels.textStyle20_700.copyWith(
          color: AppColors.kWhiteColor ,
          // color: isClicked ? AppColors.kWhiteColor : AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
