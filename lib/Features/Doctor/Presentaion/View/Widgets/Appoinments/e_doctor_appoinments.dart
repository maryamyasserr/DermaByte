import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Reservation_Cubit/my_reservation_cubit.dart';

import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Appoinments/dots_indicator.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Appoinments/patients_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    BlocProvider.of<MyReservationCubit>(context).getMyReservations(
        token: BlocProvider.of<AuthCubit>(context).doctorModel!.token,
        reviwed: 'true');
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
        top: 70,
        right: 6,
        left: 6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
