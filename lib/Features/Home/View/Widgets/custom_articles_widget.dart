import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomArticlesWidget extends StatelessWidget {
  const CustomArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 333 / 220,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              'DermaByte',
              style: Styels.textStyle20_700(context).copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/articles_pic.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What Is DermaByte?',
                    style: Styels.textStyle16_400(context).copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'DermaByte is a comprehensive healthcare solution designed to improve patient care,',
                    style:
                        Styels.textStyle18_300(context).copyWith(fontSize: 16),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
