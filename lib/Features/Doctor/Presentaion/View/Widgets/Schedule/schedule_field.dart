import 'package:dermabyte/Features/Authentication/Presentation/View/Widgets/text_form.dart';
import 'package:flutter/material.dart';

class ScheduleForm extends StatelessWidget {
  const ScheduleForm({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextForm(
            label: label,
            controller: controller,
          ),
        ),
      ),
    );
  }
}
