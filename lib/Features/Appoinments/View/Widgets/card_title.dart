import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({super.key, required this.cardTitle, required this.cardSubTitle});
  final String cardTitle, cardSubTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.36,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardTitle,
              style: Styels.textStyle16_600,
            ),
            const SizedBox(height: 7),
            Text(
              cardSubTitle,
              style: Styels.textStyle12_300,
            )
          ],
        ),
      ),
    );
  }
}
