import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/E-doctor/Data/Repos/edoctor_repo_impl.dart';
import 'package:dermabyte/Features/E-doctor/Presentaion/View/Widgets/edoctor_view_body.dart';
import 'package:dermabyte/Features/E-doctor/Presentaion/View_Model/E-Doctor%20Cubit/edoctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EdoctorView extends StatelessWidget {
  const EdoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EdoctorCubit(getIt.get<EdoctorRepoImpl>()),
      child: const EdoctorViewBody(),
    );
  }
}
