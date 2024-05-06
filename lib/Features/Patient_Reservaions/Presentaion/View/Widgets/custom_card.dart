import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.iconCard,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.textButton,
      this.textButton2,
      this.antoherButton,
      this.onPressed,
      this.onDelete});
  final String iconCard, cardTitle, cardSubTitle, textButton;
  final String? textButton2;
  final void Function()? onPressed, onDelete;

  final bool? antoherButton;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 320 / 140,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 2.6),
                blurRadius: 6.0,
              )
            ]),
        child: Row(children: [
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: SvgPicture.asset(
              iconCard,
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: CardText(
                      titleWidth: MediaQuery.sizeOf(context).width * 0.645,
                      subTitleWidth: MediaQuery.sizeOf(context).width * 0.6,
                      cardTitle: cardTitle,
                      cardSubTitle: cardSubTitle,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CardButton(
                            textButton: textButton, onPressed: onPressed),
                        const SizedBox(width: 16),
                        antoherButton == true
                            ? CardButton(
                                textButton: textButton2 ?? "",
                                onPressed: onDelete)
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
