import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class RequiredTextForm extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String label;
  bool obscureText;
  Widget? suffixIcon;
  RequiredTextForm({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: mediaQuery.width*0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.kRequiredIcon),
          SizedBox(height: mediaQuery.height * 0.005),
          Container(
            height: mediaQuery.height *0.055,
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: controller,
              validator: validator,
              obscureText: obscureText,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                fillColor: AppColors.kFilledTextForm,
                filled: true,
                hintText: label,
                hintStyle: Styels.textStyle20_200.copyWith(
                  color: AppColors.kTextInForm.withOpacity(0.8),
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
