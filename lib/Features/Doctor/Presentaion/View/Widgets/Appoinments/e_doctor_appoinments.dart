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
        reviwed: 'true',
        completed: 'false');
    BlocProvider.of<MyPatientReportCubit>(context).getMyPatientsReport(
        token: BlocProvider.of<AuthCubit>(context).doctorModel!.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.08,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Center(
            child: Text('My Schedule',
                style: Styels.textStyle24_600(context).copyWith(fontSize: 28)),
          ),
        ),
        const SizedBox(height: 24),
        const Expanded(child: PatientsDay()),
      ],
    );
  }
}
