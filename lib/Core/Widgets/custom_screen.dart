import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/appoinments_view.dart';
import 'package:dermabyte/Features/E-doctor/View/edoctor_view.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/elab_view.dart';
import 'package:dermabyte/Features/Home/View/home_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({Key? key}) : super(key: key);

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  int selectedIndex = 0;

  List<String> selectedIcons = [
    Assets.kSelectedHomeIcon,
    Assets.kSelectedAppoinmentsIcon,
    Assets.kSelectedLabIcon,
    Assets.kSelectedDoctorIcon,
  ];

  List<String> unselectedIcons = [
    Assets.kUnSelectedHomeIcon,
    Assets.kUnSelectedAppoinmentsIcon,
    Assets.kUnSelectedLabIcon,
    Assets.kUnSelectedDoctorIcon,
  ];

  List<Widget> pages = [
    const HomeView(),
    const AppoinmentsView(),
    const ElabView(),
    const EdoctorView(),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        height: mediaQuery.height * 0.2,
        width: mediaQuery.width * 0.20,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        padding: const EdgeInsets.all(8),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.kScanWaysView);
          },
          // ignore: sort_child_properties_last
          child: Text(
            'Scan',
            style: Styels.textStylee20_700(context),
          ),
          backgroundColor: AppColors.kScanButton,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                selectedIndex == 0 ? selectedIcons[0] : unselectedIcons[0],
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                selectedIndex == 1 ? selectedIcons[1] : unselectedIcons[1],
              ),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                selectedIndex == 2 ? selectedIcons[2] : unselectedIcons[2],
              ),
              label: 'E-Lab',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                selectedIndex == 3 ? selectedIcons[3] : unselectedIcons[3],
              ),
              label: 'E-Doctor',
            ),
          ]),
    );
  }
}
