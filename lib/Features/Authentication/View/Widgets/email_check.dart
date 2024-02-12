import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/View/Widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class EmailCheck extends StatelessWidget {
  const EmailCheck({
    super.key,
    required this.mediaQuery, required this.text, required this.textButton, required this.onPressed,
  });

  final Size mediaQuery;
  final String text, textButton;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Styels.textStyle18_300(context)
              .copyWith(color: const Color.fromRGBO(0, 0, 0, 0.4)),
        ),
        SizedBox(width: mediaQuery.width * 0.0002),
        CustomTextButton(
          text:textButton,
          onPressed:onPressed
        )
      ],
    );
  }
}

