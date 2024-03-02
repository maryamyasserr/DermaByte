import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/History/history_body.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/History%20Repo/history_repo_impl.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Consults%20Cubit/consults_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Scan%20Cubit/scan_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ScanCubit(getIt.get<HistoryRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => TestsCubit(getIt.get<HistoryRepoImpl>()),
            ),
              BlocProvider(
              create: (context) => ConsultsCubit(getIt.get<HistoryRepoImpl>()),
            ),
          ],
          child: const HistoryBody(),
        ),
      ),
    );
  }
}
