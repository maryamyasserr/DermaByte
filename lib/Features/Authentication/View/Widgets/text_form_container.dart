import 'package:dermabyte/Features/Authentication/View/Widgets/text_form.dart';
import 'package:flutter/material.dart';

class TextFormContainer extends StatelessWidget {
  const TextFormContainer(
      {super.key,
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
      height: mediaQuery.height * 0.054,
      child: TextForm(
        label: label,
        controller: controller,
      ),
    );
  }
}
