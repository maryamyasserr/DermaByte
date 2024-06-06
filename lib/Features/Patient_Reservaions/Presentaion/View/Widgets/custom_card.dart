import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.iconCard,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.textButton,
      this.textButton2,
      this.antoherButton,
      this.onPressed,
      this.onDelete});
  final String? iconCard;
  final String cardTitle, cardSubTitle, textButton;
  final String? textButton2;
  final void Function()? onPressed, onDelete;

  final bool? antoherButton;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 320 / 140,
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
        child: Row(children: [
          Expanded(
            flex: 2,
            child: iconCard == null
                ? Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: SvgPicture.asset(
                      Assets.kFollowUpIcon,
                    ),
                  )
                : ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    child: AspectRatio(
                      aspectRatio: 0.5,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: iconCard!,
                      ),
                    ),
                  ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: CardText(
                      titleWidth: MediaQuery.sizeOf(context).width * 0.645,
                      subTitleWidth: MediaQuery.sizeOf(context).width * 0.6,
                      cardTitle: cardTitle,
                      cardSubTitle: cardSubTitle,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CardButton(
                            textButton: textButton, onPressed: onPressed),
                        const SizedBox(width: 16),
                        antoherButton == true
                            ? CardButton(
                                textButton: textButton2 ?? "",
                                onPressed: onDelete)
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
