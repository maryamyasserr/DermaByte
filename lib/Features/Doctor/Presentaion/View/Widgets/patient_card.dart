import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PatientCard extends StatelessWidget {
  const PatientCard(
      {super.key,
      this.imageCard,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.diagnose,
      this.hour,
      this.minutes,
      this.date,
      required this.textButton,
      required this.show,
      required this.onPressed,
      required this.onTap});
  final String cardTitle, cardSubTitle, textButton;
  final int? hour;
  final int? minutes;
  final bool show;
  final String? imageCard, date;
  final void Function() diagnose, onPressed, onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: 300 / 125,
          child: Stack(
            children: [
              Container(
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
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    Assets.kAvatar,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)),
                                  child: AspectRatio(
                                    aspectRatio: 0.6,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: imageCard!,
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  child: CardText(
                                    titleWidth:
                                        MediaQuery.sizeOf(context).width *
                                            0.645,
                                    subTitleWidth:
                                        MediaQuery.sizeOf(context).width * 0.63,
                                    cardTitle: cardTitle,
                                    cardSubTitle: cardSubTitle,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(child: SizedBox()),
                                    show == true
                                        ? CardButton(
                                            textButton: "Diagnose",
                                            onPressed: diagnose,
                                          )
                                        : const SizedBox(),
                                    const SizedBox(width: 8),
                                    CardButton(
                                      textButton: textButton,
                                      onPressed: onPressed,
                                    ),
                                    const SizedBox(width: 10)
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
              date == null
                  ? Positioned(
                      top: 10,
                      right: 20,
                      child: Row(
                        children: [
                          Text("$hour"),
                          minutes == null
                              ? const SizedBox()
                              : Text(":${minutes.toString().padLeft(2, '0')}"),
                          hour! > 12 ? const Text(' PM') : const Text(' AM')
                        ],
                      ))
                  : Positioned(top: 10, right: 10, child: Text("$date"))
            ],
          ),
        ));
  }
}
