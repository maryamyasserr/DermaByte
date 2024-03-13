import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo_impl.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/lab_body.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Reservaions%20Cubit/lab_reservations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabView extends StatelessWidget {
  const LabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LabReservationsCubit(getIt.get<LabRepoImpl>()),
      child: const SafeArea(child: LabBody()),
    );
  }
}
