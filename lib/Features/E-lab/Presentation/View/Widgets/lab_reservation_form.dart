import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/custom_text_field.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/lab_reservation_view_body.dart';
import 'package:flutter/material.dart';

class LabReservationForm extends StatelessWidget {
  const LabReservationForm({
    super.key,
    required this.widget,
    required this.mediaQuery,
  });

  final LabReservationViewBody widget;
  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextField(
            controller: widget.dayController,
            hintext: 'Day',
            width: mediaQuery.height * 0.12,
            isrequired: true,
            padding: const EdgeInsets.only(left: 80),
            keyboardType: TextInputType.number),
        CustomTextField(
            controller: widget.monthController,
            hintext: 'Month',
            width: mediaQuery.height * 0.12,
            isrequired: true,
            padding: const EdgeInsets.only(left: 80),
            keyboardType: TextInputType.number),
        CustomTextField(
            controller: widget.preferdTime,
            hintext: 'Preferred time',
            width: mediaQuery.height * 0.19,
            isrequired: true,
            padding: const EdgeInsets.only(left: 110),
            keyboardType: TextInputType.datetime),
      ],
    );
  }
}
