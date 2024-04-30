import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PatientCard extends StatelessWidget {
  const PatientCard(
      {super.key,
      this.imageCard,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.diagnose,
      required this.date,
      required this.start,
      required this.onTap});
  final String cardTitle, cardSubTitle,date;
  final String ?imageCard;
  final void Function() diagnose, start, onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 342 / 140,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                  Expanded(
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: AspectRatio(
                        aspectRatio: 0.5,
                        child: imageCard==null?
                        SvgPicture.asset(
                          Assets.kAvatar
                        ):
                         CachedNetworkImage(
                          fit: BoxFit.fill,
                        imageUrl: imageCard!,
                        ),
                      ),
                    )
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: CardText(
                                    cardTitle: cardTitle,
                                    cardSubTitle: cardSubTitle,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Text(
                                      date,
                                      style: Styels.textStyle14_300(context),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              CardButton(
                                textButton: "Diagnose",
                                onPressed: diagnose,
                              ),
                              const SizedBox(width: 8),
                              CardButton(
                                textButton: "Start",
                                onPressed: start,
                              ),
                            ],
                          ),
                        ),
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
