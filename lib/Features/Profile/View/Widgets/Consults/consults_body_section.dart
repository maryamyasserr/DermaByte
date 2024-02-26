import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class ConsultsBodySection extends StatelessWidget {
  const ConsultsBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What is Melanoma?",
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            "Test requested.",
            style: Styels.textStyle24_600(context),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              " - Test one for Melanoma..",
              style: Styels.textStyle15_300(context),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              " - Test one for Melanoma..",
              style: Styels.textStyle15_300(context),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              " - Test one for Melanoma..",
              style: Styels.textStyle15_300(context),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            "Medications",
            style: Styels.textStyle24_600(context),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              " - Test one for Melanoma..",
              style: Styels.textStyle15_300(context),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              " - Test one for Melanoma..",
              style: Styels.textStyle15_300(context),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              " - Test one for Melanoma..",
              style: Styels.textStyle15_300(context),
            ),
          ),
        ],
      ),
    );
  }
}
