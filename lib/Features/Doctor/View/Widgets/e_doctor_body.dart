import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/Appoinments/e_doctor_appoinments.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/Home/e_doctor_home.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/Profile/e_doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EdoctorBody extends StatefulWidget {
  const EdoctorBody({super.key});

  @override
  State<EdoctorBody> createState() => _EdoctorBodyState();
}

class _EdoctorBodyState extends State<EdoctorBody> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: Styels.textStyle18_400(context).copyWith(fontSize: 14),
        unselectedLabelStyle: Styels.textStyle12_200(context),
        iconSize: 35,
        selectedItemColor: AppColors.kPrimaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
           BottomNavigationBarItem(
              icon:  Icon(FontAwesomeIcons.calendarCheck),
              label: "Appoinments"),
          // BottomNavigationBarItem(
          //     icon: SvgPicture.asset(Assets.kRequests), label: "Requests"),
           BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.userDoctor), label: "Profile"),
        ],
      ),
      body:  Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.kBackground),
            fit: BoxFit.cover
            )
        ),
        child: PageView(
            controller: _pageController,
            onPageChanged: (page){},
            physics: const NeverScrollableScrollPhysics(),
            children: [const EdoctorHome(),const EdoctorAppoinments(),EdoctorProfile()],
          ),
      )
    );
  }
}
