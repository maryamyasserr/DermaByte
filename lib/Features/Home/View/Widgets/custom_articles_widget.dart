import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class CustomArticlesWidget extends StatelessWidget {
  const CustomArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 333 / 220,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'articles&news',
                style: Styels.textStyle18_300(context).copyWith(fontSize: 16),
              ),
              Text('view all',
                  style:
                      Styels.textStyle20_700(context).copyWith(fontSize: 16)),
            ],
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
                    'Loren Ipsum',
                    style: Styels.textStyle16_400(context).copyWith(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula porttitor eros,',
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
