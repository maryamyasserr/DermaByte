import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Profile/View/Widgets/History/history_body.dart';
import 'package:dermabyte/Features/Scan/Data/Repo/scan_repo_impl.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View%20Model/Scan%20Cubit/scan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => ScanCubit(getIt.get<ScanRepoImpl>()),
          child: const HistoryBody(),
        ),
      ),
    );
  }
}
