import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AttachDocotorReservaionField extends StatelessWidget {
  const AttachDocotorReservaionField({
    super.key,
    this.width,
    this.padding,
    required this.isrequired,
    this.controller,
    required this.title,
    required this.onTap,
  });

  final double? width;
  final EdgeInsetsGeometry? padding;
  final bool isrequired;
  final TextEditingController? controller;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      isrequired
          ? Padding(
              padding: padding!,
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(Assets.kRequiredIcon),
              ),
            )
          : const SizedBox(
              width: 0,
              height: 0,
            ),
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.075,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.kCardColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 2.6),
                  blurRadius: 6.0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Styels.textStyle18_300(context),
                ),
                const Icon(
                  Icons.add,
                  size: 35,
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
