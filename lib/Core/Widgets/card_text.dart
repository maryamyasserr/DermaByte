import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width*0.4 ,
          child: Text(
            cardTitle,
            maxLines: 1,
            style: Styels.textStyle18_600(context).copyWith(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: MediaQuery.sizeOf(context).width*0.645,
          child: Text(cardSubTitle,
              maxLines: 3,
              style: Styels.textStyle15_300(context)
                  .copyWith(overflow: TextOverflow.ellipsis)),
        ),
      ],
    );
  }
}
