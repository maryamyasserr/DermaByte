import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Styels.textStyle40(context),
      textAlign: TextAlign.center,
    );
  }
}
