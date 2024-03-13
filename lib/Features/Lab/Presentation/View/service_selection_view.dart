import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo_impl.dart';
import 'package:dermabyte/Features/Lab/Presentation/View/Widget/Lab%20Services/service_selection_view_body.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Get%20Lab%20Services/get_lab_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceSelectionView extends StatelessWidget {
  const ServiceSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetLabServicesCubit(getIt.get<LabRepoImpl>()),
      child: const Scaffold(
        body: ServiceSelectionViewBody(),
      ),
    );
  }
}
