import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Home/View/Widgets/custom_articles_widget.dart';
import 'package:dermabyte/Features/Home/View/Widgets/custom_track_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.kBackground), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const CustomAppBar(title: ''),
          SizedBox(height: mediaQuery.height * 0.06),
          Text(
            'Hi Maryam !',
            style: Styels.textStyle24_600,
          ),
          SizedBox(height: mediaQuery.height * 0.025),
          Text(
            'It’s nice to have you back.',
            style: Styels.textStyle18_400.copyWith(
              fontSize: 20
            ),
          ),
         SizedBox(height: mediaQuery.height * 0.05),
         const CustomTrackWidget(),
        SizedBox(height: mediaQuery.height * 0.06),
         const CustomArticlesWidget(),
        ]),
      ),
    );
  }
}
