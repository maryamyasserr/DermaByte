import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/medication.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/Consults/test_requsted.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConsultsBodySection extends StatelessWidget {
  const ConsultsBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TestRequested(),
          const SizedBox(height: 8),
          const Medications(),
          const SizedBox(height: 8),
          Text("Treatment plan", style: Styels.textStyle24_600(context))
        ],
      ),
    );
  }
}
