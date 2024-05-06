import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {super.key,
      this.imageCard,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.textButton,
      this.onPressed,
      this.width,
      required this.logo});
  final String cardTitle, cardSubTitle, textButton;
  final String? imageCard;
  final void Function()? onPressed;
  final bool logo;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 330 / 130,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
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
                    flex: 2,
                    child: imageCard == null
                        ? SvgPicture.asset(Assets.kDoctorAvatar)
                        : ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            child: AspectRatio(
                              aspectRatio: 0.7,
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: imageCard!,
                              ),
                            ),
                          )),
                const SizedBox(width: 16),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CardText(
                            titleWidth: MediaQuery.sizeOf(context).width * 0.55,
                            subTitleWidth:
                                MediaQuery.sizeOf(context).width * 0.55,
                            cardTitle: cardTitle,
                            cardSubTitle: cardSubTitle,
                          ),
                        ),
                      ),
                      logo == true
                          ? Expanded(
                              flex: 2,
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      Assets.kLogo,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            )
                          : Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: CardButton(
                                  textButton: textButton,
                                  onPressed: onPressed,
                                ),
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
    );
  }
}
