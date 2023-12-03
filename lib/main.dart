import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DermaByte());
}

class DermaByte extends StatelessWidget {
  const DermaByte({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColors.kPrimaryColor,
            unselectedItemColor: Colors.grey,
            ),
      ),
    );
  }
}
