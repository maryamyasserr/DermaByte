import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  const CardText({
    super.key,
    required this.cardTitle,
    required this.cardSubTitle,
  });
  final String cardTitle, cardSubTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardTitle,
                maxLines: 1,
                style: Styels.textStyle18_600(context).copyWith(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(cardSubTitle,
                  maxLines: 3,
                  style: Styels.textStyle15_300(context)
                      .copyWith(overflow: TextOverflow.ellipsis)),
            ],
          ),
        ),
      ],
    );
  }
}
