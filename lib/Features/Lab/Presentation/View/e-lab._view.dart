import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_requests_repo_impl.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/e_lab_body.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Request%20Cubit/lab_request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ELabView extends StatelessWidget {
  const ELabView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => LabRequestCubit(getIt.get<LabRequestsRepoImpl>()),
      child: const SafeArea(child: ElabBody()),
    );
  }
}
