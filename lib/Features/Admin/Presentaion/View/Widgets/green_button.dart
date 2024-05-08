import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({super.key, required this.title, this.onPressed});

  final String title;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green[900]),
      child: Text(
        title,
        style: Styels.textStyle12_700(context).copyWith(color: Colors.white),
      ),
    );
  }
}
