import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-doctor/View/Widgets/doctor_item.dart';
import 'package:flutter/material.dart';

class EdoctorViewBody extends StatelessWidget {
  EdoctorViewBody({super.key});
  
 final List<DoctorItem> doctors = [
      DoctorItem(
        iconCard: Assets.kManIcon,
        doctorTitle: 'Dr. Mohamed',
        doctorSubTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        onPressed: () {

        },
        textButton: 'Reserve',
      ),
      DoctorItem(
        iconCard: Assets.kWomanIcon,
        doctorTitle: 'Dr. Nadeen',
        doctorSubTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        onPressed: () {

        },
        textButton: 'Reserve',
      ),
      DoctorItem(
        iconCard: Assets.kWomanIcon,
        doctorTitle: 'Dr. Mai',
        doctorSubTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        onPressed: () {

        },
        textButton: 'Reserve',
      ),
      DoctorItem(
        iconCard: Assets.kManIcon,
        doctorTitle: 'Dr. Ahmed',
        doctorSubTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        onPressed: () {
          
        },
        textButton: 'Reserve',
      ),
    ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.kBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: 'Doctors'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Widest selection from the best\ncertified doctors.',
                style: Styels.textStyle15_300,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      doctors[index],
                      SizedBox(height: mediaQuery.height * 0.02),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}