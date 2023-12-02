import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(
      {super.key,
      required this.iconCard,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.onPressed});
  final String iconCard, cardTitle, cardSubTitle;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.01,
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
          Row(
            children: [
            SvgPicture.asset(
              iconCard,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            CardText(
              width: MediaQuery.of(context).size.width*0.5,
              cardTitle: cardTitle,
              cardSubTitle: cardSubTitle,
            ),
          ]),
          Positioned(
            right: 15,
            top: 10,
            child: Text("10:00 AM",style: Styels.textStyle14_300,) 
          ),
          Positioned(
              right: MediaQuery.of(context).size.width*0.06,
              bottom: 0,
              child: CardButton(
                textButton: "View",
                onPressed: onPressed,
              )),
          Positioned(
            right: MediaQuery.of(context).size.width*0.28,
              bottom: 0,
              child: CardButton(
                textButton: "Start",
                onPressed: onPressed,
              )),
        ],
      ),
    );
  }
}
