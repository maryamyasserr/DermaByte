import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View/Widgets/doctor_reservation_view_body.dart';
import 'package:flutter/material.dart';

class DoctorReservationView extends StatelessWidget {
  const DoctorReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: DoctorReservationViewBody(),
      ),
    );
  }
}
