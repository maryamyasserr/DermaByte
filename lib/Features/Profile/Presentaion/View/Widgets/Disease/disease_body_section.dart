import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class DiseaseBodySection extends StatelessWidget {
  const DiseaseBodySection({super.key, required this.diseaseName});
  final String diseaseName;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What is$diseaseName?",
            style: Styels.textStyle24_600(context),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum sem sapien, vitae luctus sapien semper sed. Curabitur vitae ligula at purus semper consectetur sollicitud...",
              style: Styels.textStyle15_300(context),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            "Possible Treatment.",
            style: Styels.textStyle24_600(context),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum sem sapien, vitae luctus sapien semper sed. Curabitur vitae ligula at purus semper consectetur sollicitud...",
              style: Styels.textStyle15_300(context),
            ),
          ),
        ],
      ),
    );
  }
}
