import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/card_button.dart';
import 'package:dermabyte/Features/Appoinments/View/Widgets/card_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem(
      {super.key,
      required this.iconCard,
      required this.doctorTitle,
      required this.doctorSubTitle,
      required this.textButton,
      this.onPressed,
      this.width});
  final String iconCard, doctorTitle, doctorSubTitle, textButton;
  final void Function()? onPressed;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.16,
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
              padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5 ,right: 10),
              child: SvgPicture.asset(
                iconCard,
                height: MediaQuery.of(context).size.height * 0.12,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.025),
            CardText(
              cardTitle: doctorTitle,
              cardSubTitle: doctorSubTitle,
            ),
          ]),
          Positioned(
          right: 8,
          bottom: 0,
          child: CardButton(
          textButton: textButton,
          onPressed: (){
            GoRouter.of(context).push(AppRoutes.kDoctorReservationView);
          },
        )),
        Positioned
        ( right:MediaQuery.of(context).size.width *0.48,
          bottom: MediaQuery.of(context).size.height *0.014,
          child: Row(
          children: [
          SvgPicture.asset('assets/images/star_icon.svg'),
          SvgPicture.asset('assets/images/star_icon.svg'),
          SvgPicture.asset('assets/images/star_icon.svg'),
          ],
        ))
        ],
      ),
    );
  }
}