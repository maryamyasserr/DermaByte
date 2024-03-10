import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Appoinments/e_doctor_appoinments.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Home/doctor_home.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Profile/e_doctor_profile.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Requests/doctor_requests.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorBody extends StatefulWidget {
  const DoctorBody({super.key});

  @override
  State<DoctorBody> createState() => _DoctorBodyState();
}

class _DoctorBodyState extends State<DoctorBody> {
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
          selectedLabelStyle:
              Styels.textStyle18_400(context).copyWith(fontSize: 14),
          unselectedLabelStyle: Styels.textStyle12_200(context),
          iconSize: 35,
          selectedItemColor: AppColors.kPrimaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.calendarCheck),
                label: "Appoinments"),
            // BottomNavigationBarItem(
            //     icon: SvgPicture.asset(Assets.kRequests), label: "Requests"),
            BottomNavigationBarItem(
                icon: Icon(Icons.call_received), label: "Requetsts"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.userDoctor), label: "Profile"),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
          child: PageView(
            controller: _pageController,
            onPageChanged: (page) {},
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const DoctorHome(),
              const EdoctorAppoinments(),
              const DoctorRequests(),
              EdoctorProfile()
            ],
          ),
        ));
  }
}
