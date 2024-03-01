import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.iconCard,
    required this.cardTitle,
    required this.cardSubTitle,
    required this.textButton,
    this.onPressed,
  });
  final String iconCard, cardTitle, cardSubTitle, textButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 330 / 140,
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
        child: Row(children: [
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: SvgPicture.asset(
              iconCard,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  flex: 3,
                  child: CardText(
                    cardTitle: cardTitle,
                    cardSubTitle: cardSubTitle,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CardButton(
                        textButton: textButton, onPressed: onPressed),
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
