import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class DiseaseHeaderSection extends StatelessWidget {
  const DiseaseHeaderSection(
      {super.key, required this.scanDate, required this.diseaseName});
  final DateTime scanDate;
  final String diseaseName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${scanDate.year}-${scanDate.month}-${scanDate.day} :${scanDate.hour}:${scanDate.minute}",
              style: Styels.textStyle14_300(context),
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
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
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    diseaseName,
                    style: Styels.textStyle24_600(context),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "The scans taken on ${scanDate.year}-${scanDate.month}-${scanDate.day} :${scanDate.hour}:${scanDate.minute} show that you have $diseaseName.",
                    style: Styels.textStyle14_300(context),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const Divider(
          thickness: 0.7,
          color: Colors.black,
        ),
      ],
    );
  }
}
