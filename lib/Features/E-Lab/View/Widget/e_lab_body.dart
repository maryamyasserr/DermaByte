import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-Lab/View/Widget/Home/home_body.dart';
import 'package:dermabyte/Features/E-Lab/View/Widget/e_lab_profile/profile_body.dart';

import 'package:flutter/material.dart';

class ElabBody extends StatefulWidget {
  const ElabBody({super.key});

  @override
  State<ElabBody> createState() => _ElabBodyState();
}

class _ElabBodyState extends State<ElabBody> {
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
            selectedLabelStyle: Styels.textStyle18_400,
            unselectedLabelStyle: Styels.textStyle14_300.copyWith(fontWeight: FontWeight.w400),
            iconSize: 35,
            selectedItemColor: AppColors.kPrimaryColor,
            unselectedItemColor: Colors.grey,
            
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,),
                label: "Home",
                ),
              BottomNavigationBarItem(icon: Icon(Icons.person,), label: "Profile"),
            ],
          ),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (page){},
          physics: const NeverScrollableScrollPhysics(),
          children: const [HomeBody(),ElabProfile()],
        ));
  }
}
