import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/History/patient_consults.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/History/patient_scans.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View/Widgets/History/patient_tests.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Scan%20Cubit/scan_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    BlocProvider.of<TestsCubit>(context).getPatientTests(
        token: BlocProvider.of<AuthCubit>(context).patient!.token);
    BlocProvider.of<ScanCubit>(context).getPatientScan(
        token: BlocProvider.of<AuthCubit>(context).patient!.token);
    BlocProvider.of<ReportCubit>(context).getPatientConults(
        token: BlocProvider.of<AuthCubit>(context).patient!.token);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            labelStyle: Styels.textStyle20_700(context),
            indicatorColor: AppColors.kPrimaryColor,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: "Scans"),
              Tab(text: "Tests"),
              Tab(text: "Consults"),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Expanded(
          child: TabBarView(controller: tabController, children: const [
            PatientScans(),
            PatientTests(),
            PatientConsults(),
          ]),
        )
      ],
    );
  }
}
