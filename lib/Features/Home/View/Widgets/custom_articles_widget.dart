import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class CustomArticlesWidget extends StatelessWidget {
  const CustomArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.33,
      width: mediaQuery.width * 1,
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('articles&news',
          style: Styels.textStyle18_300.copyWith(
            fontSize: 16
          ),
          ),
          Text('view all',
          style: Styels.textStyle20_700.copyWith(
            fontSize: 16
          )
          ),
        ],),  
        SizedBox(height: mediaQuery.height *0.005),
        Container(
          height: mediaQuery.height * 0.15,
          width: double.infinity,
          decoration:const BoxDecoration(
            image:  DecorationImage(
                image: AssetImage('assets/images/articles_pic.png',
                ),
                fit: BoxFit.fill,
                ),
          ),
        ),
        SizedBox(height: mediaQuery.height * 0.005),
        Text(
          'Loren Ipsum',
          style: Styels.textStyle16_400.copyWith(
            fontSize: 20,
          ),
        ),
        Text(
          'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit. Sed vehicula porttitor \n eros,',
          style: Styels.textStyle18_300,
        )
      ]),
    );
  }
}
