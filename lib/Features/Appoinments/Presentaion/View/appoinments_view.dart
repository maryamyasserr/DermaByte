import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Appoinments/Data/Repo/preservation_info_repo_impl.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View/Widgets/appoinments_body.dart';
import 'package:dermabyte/Features/Appoinments/Presentaion/View_Model/Cubits/Preservation_Cubit/preservation_info_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppoinmentsView extends StatelessWidget {
  const AppoinmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PreservationInfoCubit(getIt.get<PreservationInfoRepoImpl>())
      ..getPatientReservationInfo(id: BlocProvider.of<AuthCubit>(context).patientModel!.id),
      child: const AppoinmentsBody(),
    );
  }
}
