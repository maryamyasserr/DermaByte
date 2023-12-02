import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-Doctor/View/Widgets/Appoinments/patients_day.dart';
import 'package:flutter/material.dart';

class EdoctorAppoinments extends StatelessWidget {
  const EdoctorAppoinments({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height*0.03,
        horizontal: MediaQuery.of(context).size.width*0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('This week’s Schedule',
              style: Styels.textStyle24_600.copyWith(fontSize: 28)),
          Expanded(
            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return const PatientsDay();
                }),
          )
        ],
      ),
    );
  }
}
