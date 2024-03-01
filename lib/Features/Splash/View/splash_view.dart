import 'dart:async';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Splash/View/Widgets/splash_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacement(AppRoutes.kAppIntro);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashBody();
  }
}
