import 'package:dermabyte/Features/E-Lab/View/Widget/Home/home_body.dart';
import 'package:dermabyte/Features/E-Lab/View/Widget/e_lab_profile/profile_body.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ElabBody extends StatefulWidget {
  const ElabBody({super.key});

  @override
  State<ElabBody> createState() => _ElabBodyState();
}

class _ElabBodyState extends State<ElabBody> {
  int selectedIndex = 0;

  List<Widget> widgets = [HomeBody(), ElabProfile()];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (page){},
          physics: const NeverScrollableScrollPhysics(),
          children: const [HomeBody(),ElabProfile()],
        ));
  }
}
