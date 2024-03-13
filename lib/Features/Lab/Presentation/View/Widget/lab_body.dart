import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Home/home_body.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/lab_profile/profile_body.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/service_selection_view.dart';

import 'package:flutter/material.dart';

class LabBody extends StatefulWidget {
  const LabBody({super.key});

  @override
  State<LabBody> createState() => _LabBodyState();
}

class _LabBodyState extends State<LabBody> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              _pageController.jumpToPage(index);
              setState(() {
                selectedIndex = index;
              });
            },
            selectedLabelStyle: Styels.textStyle18_400(context),
            unselectedLabelStyle: Styels.textStyle14_300(context)
                .copyWith(fontWeight: FontWeight.w400),
            iconSize: 35,
            selectedItemColor: AppColors.kPrimaryColor,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.medical_services_outlined,
                ),
                label: "Services",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: "Profile"),
            ],
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.kBackground), fit: BoxFit.cover)),
          child: PageView(
            controller: _pageController,
            onPageChanged: (page) {},
            physics: const NeverScrollableScrollPhysics(),
            children: const [HomeBody(),ServiceSelectionView(), ElabProfile()],
          ),
        ));
  }
}
