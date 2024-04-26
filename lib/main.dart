import 'package:dermabyte/Core/utils/bloc_observer.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Authentication/Data/Repo/auth_repo_impl.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Helper/auth_helper.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/doctor_repo_impl.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Update_Report/update_report_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Repos/edoctor_repo_impl.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/DoctorReservaion/doctor_reservation_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/E-Doctor%20Cubit/edoctor_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/FreeTimes/free_times_cubit.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/elab_repo_impl.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Elab%20Cubit/elab_cubit.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo_impl.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Add%20Lab%20Services/add_lab_services_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Get%20Lab%20Services/get_lab_services_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Helper/lab_helper_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Reservaions%20Cubit/lab_reservations_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo_impl.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Preservation_Cubit/preservation_info_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/History%20Repo/history_repo_impl.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Scan%20Cubit/scan_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const DermaByte());
  Bloc.observer = DermaByteBlocOpserver();
  setupServiceLocator();
}

class DermaByte extends StatelessWidget {
  const DermaByte({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(getIt.get<AuthRepoImpl>())),
        BlocProvider(
            create: (context) =>
                PreservationInfoCubit(getIt.get<PreservationInfoRepoImpl>())),
        BlocProvider(
            create: (context) => ScanCubit(getIt.get<HistoryRepoImpl>())
              ..getPatientScan(
                  token: BlocProvider.of<AuthCubit>(context).patient!.token)),
        BlocProvider(
            create: (context) => TestsCubit(getIt.get<HistoryRepoImpl>())
              ..getPatientTests(
                  token: BlocProvider.of<AuthCubit>(context).patient!.token)),
        BlocProvider(
            create: (context) => ReportCubit(getIt.get<HistoryRepoImpl>())
              ..getPatientConults(
                  token: BlocProvider.of<AuthCubit>(context).patient!.token)),
        BlocProvider(create: (context) => ELabCubit(getIt.get<ElabRepoImpl>())),
        BlocProvider(
          create: (context) =>
              DoctorReservationCubit(getIt.get<EdoctorRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              MyPatientReportCubit(getIt.get<DoctorRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => UpdateReportCubit(getIt.get<DoctorRepoImpl>()),
        ),
        BlocProvider(create: (context) => AuthHelperCubit()),
        BlocProvider(create: (context) => LabHelperCubit()),
        BlocProvider(
            create: (context) => AddServiceCubit(getIt.get<LabRepoImpl>())),
        BlocProvider(
          create: (context) => LabReservationsCubit(getIt.get<LabRepoImpl>()),
        ),
        BlocProvider(
            create: (context) => GetLabServicesCubit(getIt.get<LabRepoImpl>())),
        BlocProvider(
            create: (context) => FreeTimesCubit(getIt.get<EdoctorRepoImpl>())),
        BlocProvider(
             create: (context) => EdoctorCubit(getIt.get<EdoctorRepoImpl>()),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColors.kPrimaryColor,
            unselectedItemColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}

// import 'package:dermabyte/Core/utils/colors.dart';
// import 'package:dermabyte/Core/utils/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';

// void main() {
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => const DermaByte(),
//     ),
//   );
// }

// class DermaByte extends StatelessWidget {
//   const DermaByte({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,
//       routerConfig: AppRoutes.router,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           selectedItemColor: AppColors.kPrimaryColor,
//           unselectedItemColor: Colors.grey,
//         ),
//       ),
//     );
//   }
// }
