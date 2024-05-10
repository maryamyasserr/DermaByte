import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Splash/View/Widgets/splash_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    Future.delayed(const Duration(seconds: 5), () {
      GoRouter.of(context).pushReplacement(AppRoutes.kAppIntro);
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   Timer(const Duration(seconds: 3), () {
  //     GoRouter.of(context).pushReplacement(AppRoutes.kAppIntro);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
            position: slidingAnimation, child: const SplashBody());
      },
    ));
  }
}
