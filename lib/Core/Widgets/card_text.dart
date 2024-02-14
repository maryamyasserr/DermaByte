import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  const CardText(
      {super.key,
      required this.cardTitle,
      required this.cardSubTitle,
      required this.width});
  final String cardTitle, cardSubTitle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Flexible(
          child: SizedBox(height: 12),
        ),
        SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardTitle,
                maxLines: 1,
                style: Styels.textStyle18_600(context).copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(height: 7),
              Text(
                cardSubTitle,
                  maxLines: 4,
                  style: Styels.textStyle14_300(context)
                      .copyWith(overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
      ],
    );
  }
}
