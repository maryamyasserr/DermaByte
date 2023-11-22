import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/card_button.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/card_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCustomCard extends StatelessWidget {
  const ProfileCustomCard(
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.18,
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
              padding: const EdgeInsets.only(bottom: 10, right: 10),
              child: SvgPicture.asset(
                iconCard,
                height: MediaQuery.of(context).size.height * 0.15,
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
