import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Swithcer extends StatelessWidget {
  const Swithcer(
      {super.key, required this.back, required this.next, required this.date});

  final void Function() back, next;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: back,
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 40,
              color: AppColors.kPrimaryColor,
            )),
        Text(DateFormat.yMMMd().format(date),
            style: Styels.textStyle24_600(context)),
        IconButton(
            onPressed: next,
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 40,
              color: AppColors.kPrimaryColor,
            ))
      ],
    );
  }
}
