import 'package:dermabyte/Core/Widgets/custom_appbar.dart';
import 'package:dermabyte/Core/utils/assets.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorReservationViewBody extends StatefulWidget {
  const DoctorReservationViewBody({super.key});

  @override
  State<DoctorReservationViewBody> createState() =>
      _DoctorReservationViewBodyState();
}

class _DoctorReservationViewBodyState extends State<DoctorReservationViewBody> {
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
                          'Book a consultation with your\ndoctor.',
                          style: Styels.textStyle15_300(context),
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
                      SizedBox(height: mediaQuery.height * 0.015),
                      CustomTextField(
                          hintext: 'When did you start noticing skin changes?',
                          width: mediaQuery.height * 0.5,
                          isrequired: true,
                          padding: const EdgeInsets.only(right: 15),
                          keyboardType: TextInputType.name),
                      SizedBox(height: mediaQuery.height * 0.015),
                      Stack(children: [
                        CustomTextField(
                            hintext: 'Add your scans',
                            width: mediaQuery.height * 0.5,
                            isrequired: true,
                            padding: const EdgeInsets.only(right: 15),
                            keyboardType: TextInputType.none),
                        Positioned(
                            right: 20,
                            bottom: 30,
                            child: InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    'assets/images/add_icon.svg'))),
                      ]),
                      Stack(children: [
                        CustomTextField(
                            hintext: 'Add your lab tests',
                            width: mediaQuery.height * 0.5,
                            isrequired: false,
                            padding: const EdgeInsets.only(right: 15),
                            keyboardType: TextInputType.none),
                        Positioned(
                            right: 20,
                            bottom: 30,
                            child: InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    'assets/images/add_icon.svg'))),
                      ]),
                    ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
