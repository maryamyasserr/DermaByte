import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTrackWidget extends StatelessWidget {
  const CustomTrackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.13,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.kCheckIcon),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
              'You’re on track!',
              style: Styels.textStyle18_400
                  .copyWith(fontSize: 20, color: AppColors.kWhiteColor),
            ),
            SizedBox(width: mediaQuery.width * 0.05),
            Text(
              'Your next scan should be in 10 \n days.',
              style: Styels.textStyle18_300
                  .copyWith(fontSize: 16, color: AppColors.kWhiteColor),
            ),
          ])
        ],
      ),
    );
  }
}
