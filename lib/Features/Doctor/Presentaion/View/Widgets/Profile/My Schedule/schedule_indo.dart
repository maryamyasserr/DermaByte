import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class MySechduleInfo extends StatelessWidget {
  const MySechduleInfo({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styels.textStyle20_700(context),
        ),
        Text(
          subTitle,
          style: Styels.textStyle20_300(context),
        ),
      ],
    );
  }
}
