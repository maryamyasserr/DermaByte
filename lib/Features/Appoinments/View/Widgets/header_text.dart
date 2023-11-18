import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.only(left: 12, top: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 210,
          child: Text(
            text,
            style: Styels.textStyle14_300,
          ),
        ),
      ),
    );
  }
}
