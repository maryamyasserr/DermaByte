import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool enable;
  final TextInputType? keyboardType;
  const TextForm(
      {super.key,
      required this.label,
      required this.controller,
      this.validator,
      this.obscureText = false,
      this.suffixIcon,
      required this.enable,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        enabled: enable,
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          fillColor: AppColors.kFilledTextForm,
          filled: true,
          labelText: label,
          labelStyle: Styels.textStyle18_300(context).copyWith(
            color: AppColors.kTextInForm.withOpacity(0.8),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
        ),
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400));
  }
}
