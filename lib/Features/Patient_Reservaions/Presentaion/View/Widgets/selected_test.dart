import 'package:cached_network_image/cached_network_image.dart';
import 'package:dermabyte/Core/Widgets/card_text.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedScan extends StatelessWidget {
  const SelectedScan(
      {super.key,
      required this.imageCard,
      required this.title,
      required this.subTitle,
      this.onPressed,
      this.aspectRatio,
      required this.selected});
  final String title, subTitle;
  final String? imageCard;
  final void Function()? onPressed;
  final bool selected;
  final double? aspectRatio;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio == null ? 330 / 125 : aspectRatio!,
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
                    child: imageCard == null
                        ? SvgPicture.asset(Assets.kAvatar)
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
                          titleWidth: MediaQuery.sizeOf(context).width * 0.5,
                          subTitleWidth: MediaQuery.sizeOf(context).width * 0.6,
                          cardTitle: title,
                          cardSubTitle: subTitle,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                          
                            const Expanded(flex: 6, child: SizedBox()),
                            GestureDetector(
                              onTap: onPressed,
                              child: selected == true
                                  ? const Icon(Icons.check_circle_rounded,
                                      size: 27,
                                      color: Color.fromARGB(255, 44, 133, 47))
                                  : const Icon(Icons.circle_outlined,size: 27,),
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
    );
  }
}
