import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.textButton,
      required this.onPressed});
  final String cardTitle, cardSubTitle, textButton;
  final void Function() onPressed;
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
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CardText(
                        titleWidth: MediaQuery.sizeOf(context).width * 0.645,
                        subTitleWidth: MediaQuery.sizeOf(context).width * 0.4,
                        cardTitle: cardTitle,
                        cardSubTitle: cardSubTitle,
                      ),
                    ),
                    Expanded(
                      child: CardButton(
                        textButton: textButton,
                        onPressed: onPressed,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
