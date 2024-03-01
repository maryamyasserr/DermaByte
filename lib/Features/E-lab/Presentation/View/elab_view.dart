import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/lab_repo_impl.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View/Widgets/elab_view_body.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Lab%20Cubit/lab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElabView extends StatelessWidget {
  const ElabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LabCubit(getIt.get<LabRepoImpl>()),
      child: ElabViewBody(),
    );
  }
}
