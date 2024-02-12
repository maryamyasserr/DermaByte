import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(
      {super.key,
      required this.iconCard,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.diagnose,
      required this.start});
  final String iconCard, cardTitle, cardSubTitle;
  final void Function() diagnose, start;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kReportView);
      },
      child: Container(
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
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
                child: SvgPicture.asset(
                  iconCard,
                  color: Colors.grey[600],
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
              CardText(
                width: MediaQuery.of(context).size.width * 0.5,
                cardTitle: cardTitle,
                cardSubTitle: cardSubTitle,
              ),
            ]),
            Positioned(
                right: MediaQuery.of(context).size.width * 0.02,
                top: 10,
                child: Text(
                  "10:00 AM",
                  style: Styels.textStyle14_300(context),
                )),
            Positioned(
                right: MediaQuery.of(context).size.width * 0.02,
                bottom: 0,
                child: CardButton(
                  textButton: "Diagnose",
                  onPressed: diagnose,
                )),
            Positioned(
                right: MediaQuery.of(context).size.width * 0.31,
                bottom: 0,
                child: CardButton(
                  textButton: "Start",
                  onPressed: start,
                )),
          ],
        ),
      ),
    );
  }
}
