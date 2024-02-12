import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key, required this.info, required this.data});
  final String info, data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(
            info,
            style: Styels.textStyle16_400(context).copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            data,
            style: Styels.textStyle16_400(context),
          ),
        ],
      ),
    );
  }
}
