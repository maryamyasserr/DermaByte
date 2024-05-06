import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestCard extends StatelessWidget {
  const RequestCard(
      {super.key,
      this.imageCard,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.textButton,
      required this.onPressed});
  final String cardTitle, cardSubTitle, textButton;
  final String? imageCard;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 330 / 125,
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
                      ? SvgPicture.asset(
                          Assets.kAvatar,
                        )
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
                        ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Expanded(
                        flex: 3,
                        child: CardText(
                          titleWidth: MediaQuery.sizeOf(context).width * 0.645,
                          subTitleWidth: MediaQuery.sizeOf(context).width * 0.6,
                          cardTitle: cardTitle,
                          cardSubTitle: cardSubTitle,
                        ),
                      ),
                      Expanded(
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
