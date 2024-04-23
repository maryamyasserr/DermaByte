import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.mediaQuery,
    required this.rePasswordVisible,
    required this.onTap,
    required this.text,
    required this.controller,
    required this.validator
  });

  final Size mediaQuery;
  final bool rePasswordVisible;
  final void Function() onTap;
  final String text;
  final TextEditingController controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaQuery.height * 0.05,
      child: TextForm(
        label: text,
        validator: validator,
        controller: controller,
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
        obscureText: !rePasswordVisible,
      ),
    );
  }
}
