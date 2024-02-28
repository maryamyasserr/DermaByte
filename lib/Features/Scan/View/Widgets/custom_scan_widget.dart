import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomScanWidget extends StatelessWidget {
  String? image;
  String title, subTitle;
  CustomScanWidget(
      {super.key, this.image, required this.title, required this.subTitle});

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
          Column(
            children: [
              Expanded(
                child: Image.asset(
                  image ?? '',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const Flexible(child: SizedBox(width: 24)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(child: SizedBox(height: 20)),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style: Styels.textStyle20_700(context).copyWith(fontSize: 22),
                ),
              ),
              const SizedBox(height: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  subTitle,
                  style: Styels.textStyle16_400(context),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
