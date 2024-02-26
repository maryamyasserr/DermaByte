import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/splash_icon.png',
          ),
          SizedBox(
            height: mediaQuery.height * 0.0005,
          ),
          Text(
            'DermaByte',
            style: Styels.textStyle40(context),
          )
        ]),
      ),
    );
  }
}
