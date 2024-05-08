import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  const RedButton({super.key, required this.title, this.onPressed});

  final String title;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red[900]),
      child: Text(
        title,
        style: Styels.textStyle12_700(context).copyWith(color: Colors.white),
      ),
    );
  }
}
