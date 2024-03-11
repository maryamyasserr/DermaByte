import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class DiseaseReport extends StatelessWidget {
  const DiseaseReport({super.key, required this.diseaseName});

  final String diseaseName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width * 0.31,
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Image.asset(
              Assets.kDiseasePhoto,
              fit: BoxFit.fill,
              height: 200,
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
               diseaseName ,
              style: Styels.textStyle24_600(context),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.007),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Text(
                "The scans taken on 10th of October showed that Mohamed might be suffering from Melanoma. And Although our AI model is 95% accurate a doctor’s consultation is still a must.",
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )
      ],
    );
  }
}
