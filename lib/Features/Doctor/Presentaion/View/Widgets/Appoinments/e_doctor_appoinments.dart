import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Reservation_Cubit/my_reservation_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Appoinments/patients_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdoctorAppoinments extends StatefulWidget {
  const EdoctorAppoinments({super.key});

  @override
  State<EdoctorAppoinments> createState() => _EdoctorAppoinmentsState();
}

class _EdoctorAppoinmentsState extends State<EdoctorAppoinments> {
  @override
  void initState() {
    BlocProvider.of<MyReservationCubit>(context).getMyReservations(
        token: BlocProvider.of<AuthCubit>(context).doctorModel!.token,
        reviwed: 'true');
    BlocProvider.of<MyPatientReportCubit>(context).getMyPatientsReport(
        token: BlocProvider.of<AuthCubit>(context).doctorModel!.token);
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
          Text('My Schedule',
              style: Styels.textStyle24_600(context).copyWith(fontSize: 28)),
          const SizedBox(height: 24),
          const Expanded(child: PatientsDay()),
        ],
      ),
    );
  }
}
