import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class DashBoardHeader extends StatelessWidget {
  const DashBoardHeader({
    super.key,

    required this.headerTitle,
  });

  final String  headerTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(25))),
      height: MediaQuery.sizeOf(context).height * 0.09,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Text(
          headerTitle,
          style: Styels.textStyle24_600(context),
        ),
      ),
    );
  }
}
