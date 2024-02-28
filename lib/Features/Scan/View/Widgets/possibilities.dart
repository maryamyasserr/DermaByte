import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class Possibilities extends StatelessWidget {
  const Possibilities({
    super.key,
    required this.mediaQuery,
  });

  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 339 / 141,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
        ),
        child: Row(children: [
          const Flexible(child: SizedBox(width: 24)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(child: SizedBox(height: 20)),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'What are the possibilities?',
                  style: Styels.textStyle20_700(context),
                ),
              ),
              const Flexible(child: SizedBox(height: 12)),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'learn about all the possible cases of\nskin changes we cover in our app\nand how to avoid them.',
                  style: Styels.textStyle18_400(context),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
