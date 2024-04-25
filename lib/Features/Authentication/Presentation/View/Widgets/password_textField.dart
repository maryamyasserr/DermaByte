import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField(
      {super.key,
      required this.mediaQuery,
      required this.rePasswordVisible,
      required this.onTap,
      required this.text,
      required this.controller,
      required this.validator});

  final Size mediaQuery;
  final bool rePasswordVisible;
  final void Function() onTap;
  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: rePasswordVisible,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: onTap,
            child: rePasswordVisible == true
                ? const Icon(
                    Icons.visibility_off_outlined,
                    size: 28,
                    color: AppColors.kPrimaryColor,
                  )
                : const Icon(
                    Icons.visibility_outlined,
                    size: 28,
                    color: AppColors.kPrimaryColor,
                  )),
        fillColor: AppColors.kFilledTextForm,
        filled: true,
        labelText: text,
        labelStyle: Styels.textStyle18_300(context).copyWith(
          color: AppColors.kTextInForm.withOpacity(0.8),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
      ),
    );
  }
}
