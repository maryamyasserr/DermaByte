import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {super.key,
      required this.iconCard,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.textButton,
      this.onPressed,
      this.width});
  final String iconCard, cardTitle, cardSubTitle, textButton;
  final void Function()? onPressed;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 330 / 130,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.kCardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 2.6),
                blurRadius: 6.0,
              )
            ]),
        child: Row(
          children: [
            Expanded(
              child: Row(children: [
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: SvgPicture.asset(
                    iconCard,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CardText(
                            titleWidth: MediaQuery.sizeOf(context).width * 0.645,
                            subTitleWidth: MediaQuery.sizeOf(context).width * 0.4,
                            cardTitle: cardTitle,
                            cardSubTitle: cardSubTitle,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: CardButton(
                            textButton: textButton,
                            onPressed: onPressed,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
