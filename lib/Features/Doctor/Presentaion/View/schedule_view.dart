import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/doctor_repo_impl.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Set%20Schedule/set_schedule_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View/Widgets/Schedule/schedule_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SetScheduleCubit(getIt.get<DoctorRepoImpl>()),
          child: const ScheduleBody(),
        ),
      ),
    );
  }
}
