import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class Medications extends StatelessWidget {
  const Medications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Medications",
          style: Styels.textStyle24_600(context),
        ),
        const SizedBox(height: 10),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "- Test one for Melanoma..",
                  style: Styels.textStyle15_300(context),
                ),
              );
            }))
      ],
    );
  }
}
