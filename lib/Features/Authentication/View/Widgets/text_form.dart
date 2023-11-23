import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String label;
  bool obscureText;
  Widget? suffixIcon;
  TextForm({super.key,
   required this.label, 
   required this.controller ,  
   this.validator , 
   this.obscureText = false,
   this.suffixIcon,
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: AppColors.kFilledTextForm,
        filled: true,
        labelText: label,
        labelStyle: Styels.textStyle20_200
            .copyWith(
              color: AppColors.kTextInForm.withOpacity(0.8),
            ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
      ),
    );
  }
}
