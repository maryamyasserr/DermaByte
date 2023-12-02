import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-lab/View/Widgets/custom_scans_bottom_sheet.dart';
import 'package:dermabyte/Features/E-lab/View/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LabReservationViewBody extends StatefulWidget {
  const LabReservationViewBody({super.key});

  @override
  State<LabReservationViewBody> createState() => _LabReservationViewBodyState();
}

class _LabReservationViewBodyState extends State<LabReservationViewBody> {
  List<String> selectedTests = [];

  void showTests() async {
    final List<String> tests = [
      'Patch testing',
      'Biopsy',
      'Wood light',
      'Scrapings',
      'Tzanck testing',
      'Diascopy',
      'Prick tests',
      'Blood test',
      'Intradermal'
    ];

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext contex) {
          return CustomScanBottomSheet(tests: tests);
        });

    if (results != null) {
      setState(() {
        selectedTests = results;
      });
    }
  }

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomAppBar(title: 'Reservation'),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Reserve your lab tests.',
                          style: Styels.textStyle15_300,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: mediaQuery.height * 0.035),
                      CustomTextField(
                          hintext: 'First Name',
                          width: mediaQuery.height * 0.5,
                          isrequired: true,
                          padding: const EdgeInsets.only(right: 15),
                          keyboardType: TextInputType.name),
                      CustomTextField(
                          hintext: 'Last Name',
                          width: mediaQuery.height * 0.5,
                          isrequired: true,
                          padding: const EdgeInsets.only(right: 15),
                          keyboardType: TextInputType.name),
                      SizedBox(height: mediaQuery.height * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                              hintext: 'Age',
                              width: mediaQuery.height * 0.14,
                              isrequired: true,
                              padding: const EdgeInsets.only(left: 80),
                              keyboardType: TextInputType.number),
                          CustomTextField(
                              hintext: 'City',
                              width: mediaQuery.height * 0.14,
                              isrequired: true,
                              padding: const EdgeInsets.only(left: 80),
                              keyboardType: TextInputType.name),
                          CustomTextField(
                              hintext: 'Country',
                              width: mediaQuery.height * 0.14,
                              isrequired: true,
                              padding: const EdgeInsets.only(left: 80),
                              keyboardType: TextInputType.name),
                        ],
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                      const Divider(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                        endIndent: 5,
                        indent: 5,
                        thickness: 1,
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Pick a day to take your required tests.',
                          style: Styels.textStyle15_300,
                        ),
                      ),
                      SizedBox(height: mediaQuery.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                              hintext: 'Day',
                              width: mediaQuery.height * 0.12,
                              isrequired: true,
                              padding: const EdgeInsets.only(left: 80),
                              keyboardType: TextInputType.number),
                          CustomTextField(
                              hintext: 'Month',
                              width: mediaQuery.height * 0.12,
                              isrequired: true,
                              padding: const EdgeInsets.only(left: 80),
                              keyboardType: TextInputType.number),
                          CustomTextField(
                              hintext: 'Preferred time',
                              width: mediaQuery.height * 0.19,
                              isrequired: true,
                              padding: const EdgeInsets.only(left: 110),
                              keyboardType: TextInputType.datetime),
                        ],
                      ),
                      Stack(children: [
                        CustomTextField(
                            hintext: 'Choose your required tests.',
                            width: mediaQuery.height * 0.5,
                            isrequired: true,
                            padding: const EdgeInsets.only(right: 15),
                            keyboardType: TextInputType.none),
                        Positioned(
                            right: 20,
                            bottom: 18,
                            child: InkWell(
                                onTap: () {
                                  showTests();
                                },
                                child: SvgPicture.asset(
                                    'assets/images/bottom_sheet_icon.svg'))),
                       
                      ]),
                       SizedBox(
                          height: mediaQuery.height * 0.002,
                        ),
                        Wrap(
                          children: selectedTests
                              .map((e) => Chip(label: Text(e)))
                              .toList(),
                        ),
                    ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
