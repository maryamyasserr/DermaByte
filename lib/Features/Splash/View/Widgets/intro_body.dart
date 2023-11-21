import 'package:dermabyte/Features/Splash/View/Widgets/intro_bottom_sheet.dart';
import 'package:flutter/material.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/intro_background.png'),
                  fit: BoxFit.fill)),
        ),
        const Positioned(bottom: 0, child: IntroBottomSheet())
      ],
    );
  }
}
