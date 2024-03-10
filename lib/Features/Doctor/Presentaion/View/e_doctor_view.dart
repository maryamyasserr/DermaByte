import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/doctor_repo_impl.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Reservation_Cubit/my_reservation_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/doctor_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                MyPatientReportCubit(getIt.get<DoctorRepoImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                MyReservationCubit(getIt.get<DoctorRepoImpl>()),
          ),
        ],
        child: const DoctorBody(),
      ),
    );
  }
}
