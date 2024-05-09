import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/elab_repo_impl.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/lab_reservation_view_body.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Lab%20Reservation%20Cubit/lab_reservaion_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabReservationView extends StatelessWidget {
  const LabReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LabReservaionCubit(getIt.get<ElabRepoImpl>()),
          child: const LabReservationViewBody(),
        ),
      ),
    );
  }
}
