import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/Widgets/snack_bar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/custom_scans_bottom_sheet.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/custom_text_field.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/lab_reservation_form.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/submit_button.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Lab%20Cubit/lab_cubit.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Lab%20Reservation%20Cubit/lab_reservaion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LabReservationViewBody extends StatefulWidget {
  const LabReservationViewBody(
      {super.key, this.dayController, this.monthController, this.preferdTime});
  final TextEditingController? dayController, monthController, preferdTime;

  @override
  State<LabReservationViewBody> createState() => _LabReservationViewBodyState();
}

class _LabReservationViewBodyState extends State<LabReservationViewBody> {
  List<String> selectedTests = [];

  void showTests(
      {required List<String> tests, required void Function() onTap}) async {
    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext contex) {
          return CustomScanBottomSheet(onTap: onTap, tests: tests);
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
    LabModel lab = BlocProvider.of<ELabCubit>(context).currentLab;
    List<String> labTests = [];
    for (var e in lab.services!) {
      labTests.add(e['name']);
    }
    return BlocConsumer<LabReservaionCubit, LabReservaionState>(
      listener: (context, state) {
        if (state is LabReservaionFailuer) {
          showSnackBar(context, state.errMessage);
        } else {
          showSnackBar(context, "Done");
        }
      },
      builder: (context, state) {
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
                            LabReservationForm(
                                widget: widget, mediaQuery: mediaQuery),
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
                                        showTests(
                                            tests: labTests, onTap: () {});
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      child: SubmitButton(
                          isLoading:
                              BlocProvider.of<LabReservaionCubit>(context)
                                  .isLoading,
                          horizontal: 0,
                          textButton: "Submit",
                          onPressed: () async {
                            await BlocProvider.of<LabReservaionCubit>(context)
                                .createReservation(body: {
                              "patient": "65dc8e49feeacbd13e5da2b2",
                              "test": ["65dc99c8e4d08f0267dddae6"],
                              "lab": lab.id
                            }, token: "");
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}