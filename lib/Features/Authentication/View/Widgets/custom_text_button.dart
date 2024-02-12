
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.text, required this.onPressed,
  });
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Styels.textStyle15_300(context)
            .copyWith(color: const Color.fromRGBO(150, 1, 1, 0.5)),
      ),
    );
  }
}
