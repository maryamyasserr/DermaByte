import 'package:dermabyte/Features/Splash/View/Widgets/intro_body.dart';
import 'package:flutter/material.dart';

class AppIntro extends StatelessWidget {
  const AppIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroBody(),
    );
  }
}
