import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SCustomTextField extends StatelessWidget {
  const SCustomTextField(
      {super.key,
      required this.labelText,
      required this.width,
      this.padding,
      required this.isrequired,
      required this.keyboardType});
  final String labelText;
  final double width;
  final EdgeInsetsGeometry? padding;
  final TextInputType keyboardType;
  final bool isrequired;
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
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 2.6),
                    blurRadius: 6.0,
                  )
                ]),
            child: TextFormField(
              keyboardType: keyboardType,
              textInputAction: TextInputAction.next,
              cursorColor: AppColors.kPrimaryColor,
              decoration: InputDecoration(
                  labelText: labelText,
                  labelStyle: Styels.textStyle18_300(context)
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
