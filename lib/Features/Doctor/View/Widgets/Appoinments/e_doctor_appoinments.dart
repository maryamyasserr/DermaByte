import 'package:dermabyte/Core/utils/font_styels.dart';

import 'package:dermabyte/Features/Doctor/View/Widgets/Appoinments/dots_indicator.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/Appoinments/patients_day.dart';
import 'package:flutter/material.dart';

class EdoctorAppoinments extends StatefulWidget {
  const EdoctorAppoinments({super.key});

  @override
  State<EdoctorAppoinments> createState() => _EdoctorAppoinmentsState();
}

class _EdoctorAppoinmentsState extends State<EdoctorAppoinments> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        right: 6,
        left: 6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('This week’s Schedule',
              style: Styels.textStyle24_600(context).copyWith(fontSize: 28)),
          const SizedBox(height: 24),
          Expanded(
              child: PageView.builder(
            controller: pageController,
            itemCount: 7,
            itemBuilder: (context, index) {
              return const PatientsDay();
            },
          )),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DotsIndicator(
                currentPageIndex: currentIndex,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
