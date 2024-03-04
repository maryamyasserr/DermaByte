import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Doctor/View/Widgets/button.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/custom_scans_bottom_sheet.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/custom_text_field.dart';
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
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomAppBar(title: 'Reservation'),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Reserve your lab tests.',
                            style: Styels.textStyle15_300(context),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const Divider(
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                          endIndent: 5,
                          indent: 5,
                          thickness: 1,
                          height: 36,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Pick a day to take your required tests.',
                            style: Styels.textStyle15_300(context),
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
                              .map((e) => Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: mediaQuery.width * 0.01),
                                  child: Chip(label: Text(e))))
                              .toList(),
                        ),
                      ]),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: MyButton(
                      horizontal: 0, textButton: "Submit", onPressed: () {}),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
