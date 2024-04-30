import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo_impl.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/appoinments_body.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Delete_Reservation_Cubit/delete_reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppoinmentsView extends StatelessWidget {
  const AppoinmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteReservationCubit(getIt.get<PreservationInfoRepoImpl>()),
      child: const AppoinmentsBody(),
    );
  }
}
