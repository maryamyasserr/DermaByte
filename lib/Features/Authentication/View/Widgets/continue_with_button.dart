import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueWithButton extends StatelessWidget {
  final String buttonName;
  final Color backgroundColor;
  final String image;
  final TextStyle? textStyle;
  final Color borderSideColor;
  const ContinueWithButton(
      {super.key,
      required this.borderSideColor,
      required this.buttonName,
      required this.backgroundColor,
      required this.image,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.width * 0.10,
                vertical: mediaQuery.height * 0.015),
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderSideColor),
              borderRadius: BorderRadius.circular(15.0),
            )),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              image,
              height: mediaQuery.height * 0.035,
              width: mediaQuery.width * 0.035,
            ),
            Text(buttonName, style: textStyle),
          ],
        ));
  }
}
