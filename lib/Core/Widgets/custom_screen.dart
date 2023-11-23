import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Appoinments/View/appoinments_view.dart';
import 'package:dermabyte/Features/E-doctor/View/edoctor_view.dart';
import 'package:dermabyte/Features/E-lab/View/elab_view.dart';
import 'package:dermabyte/Features/Home/View/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({super.key});

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  int selectedIndex = 0;
  bool? isSelected;

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
        height: mediaQuery.height * 0.22,
        width: mediaQuery.width * 0.20,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        padding: const EdgeInsets.all(8),
        child: FloatingActionButton(
          onPressed: () {},
          // ignore: sort_child_properties_last
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Scan',
              style: Styels.textStylee20_700,
            ),
          ),
          backgroundColor: AppColors.kScanButton,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: false,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: isSelected == selectedIndex
                    ? SvgPicture.asset(
                        'assets/images/selected_home.svg',
                      )
                    : SvgPicture.asset(
                        'assets/images/unselected_home.svg',
                      ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: isSelected == selectedIndex
                    ? SvgPicture.asset(
                        'assets/images/selected_appoinments.svg',
                      )
                    : SvgPicture.asset(
                        'assets/images/unselected_appoinments.svg',
                      ),
                label: 'Appoinments'),
            BottomNavigationBarItem(
                icon: isSelected == selectedIndex
                    ? SvgPicture.asset(
                        'assets/images/selected_lab.svg',
                      )
                    : SvgPicture.asset(
                        'assets/images/unselected_lab.svg',
                      ), //const ImageIcon(AssetImage('assets/images/lab_icon.png')),
                label: 'E-Lab'),
            BottomNavigationBarItem(
                icon: isSelected == selectedIndex
                    ? SvgPicture.asset(
                        'assets/images/selected_doctor.svg',
                      )
                    : SvgPicture.asset(
                        'assets/images/unselected_doctor.svg',
                      ), // const ImageIcon(
                label: 'E-Doctor')
          ],
        ),
      ),
    );
  }
}
