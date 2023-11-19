import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Appoinments/View/appoinments_view.dart';
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
       
    );
  }
}
