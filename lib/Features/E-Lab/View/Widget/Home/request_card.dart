import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestCard extends StatelessWidget {
  const RequestCard(
      {super.key,
      required this.iconCard,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.textButton,
      required this.onPressed});
  final String iconCard, cardTitle, cardSubTitle, textButton;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.17,
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
      child: Stack(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SvgPicture.asset(
                iconCard,
                height: MediaQuery.of(context).size.height * 0.17,
              ),
            ),
            CardText(
              cardTitle: cardTitle,
              cardSubTitle: cardSubTitle,
            ),
          ]),
          Positioned(
              right: 8,
              bottom: 0,
              child: CardButton(
                textButton: textButton,
                onPressed: onPressed,
              ))
        ],
      ),
    );
  }
}
