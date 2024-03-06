import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-doctor/Presentaion/View/Widgets/custom_days_bottom_sheet.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorScheduleBody extends StatefulWidget {
  const DoctorScheduleBody({super.key});

  @override
  State<DoctorScheduleBody> createState() => _DoctorScheduleBodyState();
}

class _DoctorScheduleBodyState extends State<DoctorScheduleBody> {
  List<String> selectedDays = [];

  void showDays() async {
    final List<String> days = [
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
    ];

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext contex) {
          return CustomDayBottomSheet(days: days);
        });

    if (results != null) {
      setState(() {
        selectedDays = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.kBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: mediaQuery.height * 0.1),
              Text(
                'create your schedule',
                style: Styels.textStyle18_600(context).copyWith(fontSize: 24),
              ),
              SizedBox(height: mediaQuery.height * 0.05),
              Stack(children: [
                CustomTextField(
                    hintext: 'Choose your Days.',
                    width: mediaQuery.height * 0.5,
                    isrequired: true,
                    padding: const EdgeInsets.only(right: 15),
                    keyboardType: TextInputType.none),
                Positioned(
                    right: 20,
                    bottom: 18,
                    child: InkWell(
                        onTap: () {
                          showDays();
                        },
                        child: SvgPicture.asset(
                            'assets/images/bottom_sheet_icon.svg'))),
              ]),
              SizedBox(
                height: mediaQuery.height * 0.002,
              ),
              Wrap(
                children: selectedDays
                    .map((e) => Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: mediaQuery.width * 0.01),
                        child: Chip(label: Text(e))))
                    .toList(),
              ),
              const SizedBox(height: 20),
            ])));
  }
}
