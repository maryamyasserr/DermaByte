import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTrackWidget extends StatelessWidget {
  const CustomTrackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 341 / 89,
      child: Container(
        padding: const EdgeInsets.only(left: 15, top: 8),
        decoration: BoxDecoration(
            color: AppColors.kPrimaryColor,
            borderRadius: BorderRadius.circular(35.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 2.6),
                blurRadius: 8.0,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.kCheckIcon),
            const SizedBox(width: 8),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'You’re on track!',
                  style: Styels.textStyle18_400(context)
                      .copyWith(fontSize: 20, color: AppColors.kWhiteColor),
                ),
              ),
              // const Expanded(child: SizedBox()),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Your next scan should be in 10 \n days.',
                  style: Styels.textStyle18_300(context)
                      .copyWith(fontSize: 16, color: AppColors.kWhiteColor),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
