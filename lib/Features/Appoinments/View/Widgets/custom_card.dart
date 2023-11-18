import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/card_button.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/card_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.iconCard, required this.cardTitle, required this.cardSubTitle, required this.textButton});
  final String iconCard,cardTitle,cardSubTitle,textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.94,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(
          color: OurColors.kCardColor,
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
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: SvgPicture.asset(
            iconCard,
            height: 140,
          ),
        ),
        CardTitle(cardTitle: cardTitle, cardSubTitle: cardSubTitle),
        CardButton(textButton: textButton)
      ]),
    );
  }
}
