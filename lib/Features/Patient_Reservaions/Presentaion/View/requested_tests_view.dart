import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo_impl.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View/Widgets/requested_tests_body.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Add_Test_Result_Cubit/add_test_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestedTestsView extends StatelessWidget {
  const RequestedTestsView({super.key, required this.testData});

  final TestData testData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              AddTestResultCubit(getIt.get<PreservationInfoRepoImpl>()),
          child: RequestedTestsBody(
            testName: testData.test,
            testsCounts: testData.testCount,
          ),
        ),
      ),
    );
  }
}

class TestData {
  final List<dynamic>? test;
  final int testCount;

  TestData({required this.test, required this.testCount});
}
