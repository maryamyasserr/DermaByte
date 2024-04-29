import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/Widgets/card_button.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem(
      {super.key,
      required this.imageCard,
      required this.title,
      required this.subTitle,
      required this.textButton,
      required this.price,
      this.onPressed,
      this.width});
  final String imageCard, title, subTitle, textButton,price;
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
        child: Row(
          children: [
            Expanded(
              child: Row(children: [
                // const SizedBox(width: 16),
                Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: imageCard,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )),
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
                          cardTitle: title,
                          cardSubTitle: subTitle,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text("$price"r"$",style:Styels.textStyle16_400(context).copyWith(color: const Color.fromARGB(255, 44, 133, 47)) ,),
                            const Expanded(flex: 6, child: SizedBox()),
                            CardButton(
                                textButton: textButton, onPressed: onPressed),
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
    );
  }
}
