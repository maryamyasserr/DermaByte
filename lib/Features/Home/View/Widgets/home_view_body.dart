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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.kBackground), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(title: ''),
                  const Flexible(child: SizedBox(height: 24)),
                  Text(
                    'Hi Maryam !',
                    style: Styels.textStyle24_600(context),
                  ),
                  const Flexible(child: SizedBox(height: 12)),
                  Text(
                    'It’s nice to have you back.',
                    style:
                        Styels.textStyle18_400(context).copyWith(fontSize: 20),
                  ),
                  const Flexible(child: SizedBox(height: 48)),
                  const CustomTrackWidget(),
                  const Flexible(child: SizedBox(height: 32)),
                  const CustomArticlesWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
