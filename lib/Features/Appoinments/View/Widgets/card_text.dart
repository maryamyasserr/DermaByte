import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  const CardText(
      {super.key, required this.cardTitle, required this.cardSubTitle, this.width});
  final String cardTitle, cardSubTitle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.44,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardTitle,
              style: Styels.textStyle18_600,
            ),
            const SizedBox(height: 7),
            Text(
              cardSubTitle,
              style: Styels.textStyle12_200,
            )
          ],
        ),
      ),
    );
  }
}
