import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LabItem extends StatelessWidget {
  const LabItem(
      {super.key,
      required this.iconCard,
      required this.labTitle,
      required this.labSubTitle,
      required this.textButton,
      this.onPressed,
      this.width});
  final String iconCard, labTitle, labSubTitle, textButton;
  final void Function()? onPressed;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 330 / 125,
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
        child: InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRoutes.kScanView);
          },
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: SvgPicture.asset(
                      iconCard,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Expanded(
                          flex: 2,
                          child: CardText(
                            cardTitle: labTitle,
                            cardSubTitle: labSubTitle,
                           
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/images/star_icon.svg'),
                              SvgPicture.asset('assets/images/star_icon.svg'),
                              SvgPicture.asset('assets/images/star_icon.svg'),
                              const Expanded(
                                flex: 3,
                                child: SizedBox()),
                              CardButton(
                                textButton: textButton,
                                onPressed: () {
                                  GoRouter.of(context)
                                      .push(AppRoutes.kLabReservationView);
                                },
                              ),
                              const Flexible(child: SizedBox(width: 8)),
                            ],
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
      ),
    );
  }
}
