import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LabItem extends StatelessWidget {
  const LabItem(
      {super.key,
      required this.imageCard,
      required this.labTitle,
      required this.labSubTitle,
      required this.textButton,
      this.onTap,
      this.onButtonPressed,
      this.width});
  final String labTitle, labSubTitle, textButton;
  final String? imageCard;
  final void Function()? onTap, onButtonPressed;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 330 / 125,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
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
                              aspectRatio: 0.8,
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: imageCard!,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Expanded(
                          flex: 2,
                          child: CardText(
                            titleWidth:
                                MediaQuery.sizeOf(context).width * 0.645,
                            subTitleWidth:
                                MediaQuery.sizeOf(context).width * 0.6,
                            cardTitle: labTitle,
                            cardSubTitle: labSubTitle,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(flex: 6, child: SizedBox()),
                              CardButton(
                                  textButton: textButton,
                                  onPressed: onButtonPressed),
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
