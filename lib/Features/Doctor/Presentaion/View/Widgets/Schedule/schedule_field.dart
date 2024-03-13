import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:flutter/material.dart';

class ShceduleForm extends StatelessWidget {
  const ShceduleForm({
    super.key,
    required this.mediaQuery,
    required this.label,
    required this.controller,
  });

  final Size mediaQuery;
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) { 
    return SizedBox(
      height: mediaQuery.height * 0.07,
      child: Center(
        child: TextForm(
          label: label,
          controller: controller,
        ),
      ),
    );
  }
}