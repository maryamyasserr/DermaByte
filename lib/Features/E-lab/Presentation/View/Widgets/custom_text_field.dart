import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintext,
      this.width,
      this.padding,
      required this.isrequired,
      required this.keyboardType, this.controller});
  final String hintext;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextInputType keyboardType;
  final bool isrequired;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            width: width,
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
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              textInputAction: TextInputAction.next,
              cursorColor: AppColors.kPrimaryColor,
              decoration: InputDecoration(
                  hintText: hintext,
                  hintStyle: Styels.textStyle18_300(context)
                      .copyWith(color: AppColors.kTextInForm),
                  border:
                      const OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
        ),
      ],
    );
  }
}
