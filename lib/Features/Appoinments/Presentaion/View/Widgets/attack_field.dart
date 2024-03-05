import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class AttachedField extends StatelessWidget {
  const AttachedField({super.key, required this.title, required this.onTap});
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.07,
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
                style: Styels.textStyle16_400(context),
              ),
              const Icon(
                Icons.add,
                size: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
