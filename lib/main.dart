// import 'package:dermabyte/Core/utils/colors.dart';
// import 'package:dermabyte/Core/utils/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';

// void main() {
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => const DermaByte(),
//     ),
//   );
// }

// class DermaByte extends StatelessWidget {
//   const DermaByte({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,
//       routerConfig: AppRoutes.router,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           selectedItemColor: AppColors.kPrimaryColor,
//           unselectedItemColor: Colors.grey,
//         ),
//       ),
//     );
//   }
// }

import 'package:dermabyte/Core/utils/bloc_observer.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const DermaByte());
  Bloc.observer = DermaByteBlocOpserver();
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
