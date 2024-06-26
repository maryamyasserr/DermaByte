import 'package:dermabyte/Core/utils/bloc_observer.dart';
import 'package:dermabyte/Core/utils/colors.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Core/utils/service_locator.dart';
import 'package:dermabyte/Features/Admin/Data/Repo/admin_repo_impl.dart';
import 'package:dermabyte/Features/Admin/Presentaion/View%20Model/cubit/admin_cubit.dart';
import 'package:dermabyte/Features/Authentication/Data/Repo/auth_repo_impl.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Cubit/auth_cubit.dart';
import 'package:dermabyte/Features/Authentication/Presentation/View%20Model/Auth%20Helper/auth_helper.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/doctor_repo_impl.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Get%20My%20FreeTimes/get_my_freetimes_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My%20Schedule/my_schedule_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Patinets_Reports/my_patient_report_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/My_Reservation_Cubit/my_reservation_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Set%20Schedule/set_schedule_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Update%20Doctor%20Profile/update_doctor_profile_cubit.dart';
import 'package:dermabyte/Features/Doctor/Presentaion/View%20Model/Update_Report/update_report_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Repos/edoctor_repo_impl.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/DoctorReservaion/doctor_reservation_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/E-Doctor%20Cubit/edoctor_cubit.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Presentaion/View_Model/FreeTimes/free_times_cubit.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/elab_repo_impl.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Elab%20Cubit/elab_cubit.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo_impl.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Services/lab_services_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Attach%20Result/attach_result_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Get%20Lab%20Services/get_lab_services_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Helper/lab_helper_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Lab%20Reservaions%20Cubit/lab_reservations_cubit.dart';
import 'package:dermabyte/Features/Lab/Presentation/View_Model/Update%20Lab%20Profile/update_lab_profile_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo_impl.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Add_Test_Result_Cubit/add_test_result_cubit.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Presentaion/View_Model/Preservation_Cubit/preservation_info_cubit.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/Profle%20Repo/profile_repo_impl.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Reports%20Cubit/reports_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Scan%20Cubit/scan_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Tests%20Cubit/tests_cubit.dart';
import 'package:dermabyte/Features/Profile/Presentaion/View_Model/Cubits/Update%20Patient%20Profile/update_patient_profile_cubit.dart';
import 'package:dermabyte/Features/Scan/Data/Repo/scan_repo_impl.dart';
import 'package:dermabyte/Features/Scan/Presentaion/View%20Model/Create%20Scan%20Cubit/create_scan_cubit.dart';
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
            create: (context) => ScanCubit(getIt.get<PofileRepoImpl>())
              ..getPatientScan(
                  token: BlocProvider.of<AuthCubit>(context).patient!.token)),
        BlocProvider(
            create: (context) => TestsCubit(getIt.get<PofileRepoImpl>())
              ..getPatientTests(
                  token: BlocProvider.of<AuthCubit>(context).patient!.token)),
        BlocProvider(
            create: (context) => ReportCubit(getIt.get<PofileRepoImpl>())
              ..getPatientConults(
                  token: BlocProvider.of<AuthCubit>(context).patient!.token)),
        BlocProvider(create: (context) => ELabCubit(getIt.get<ElabRepoImpl>())),
        BlocProvider(
            create: (context) =>
                DoctorReservationCubit(getIt.get<EdoctorRepoImpl>())),
        BlocProvider(
            create: (context) =>
                MyPatientReportCubit(getIt.get<DoctorRepoImpl>())),
        BlocProvider(
            create: (context) =>
                UpdateReportCubit(getIt.get<DoctorRepoImpl>())),
        BlocProvider(create: (context) => AuthHelperCubit()),
        BlocProvider(create: (context) => LabHelperCubit()),
        BlocProvider(
            create: (context) => LabServiceCubit(getIt.get<LabRepoImpl>())),
        BlocProvider(
            create: (context) =>
                LabReservationsCubit(getIt.get<LabRepoImpl>())),
        BlocProvider(
            create: (context) => GetLabServicesCubit(getIt.get<LabRepoImpl>())),
        BlocProvider(
            create: (context) => FreeTimesCubit(getIt.get<EdoctorRepoImpl>())),
        BlocProvider(
            create: (context) => EdoctorCubit(getIt.get<EdoctorRepoImpl>())),
        BlocProvider(
            create: (context) => CreateScanCubit(getIt.get<ScanRepoImpl>())),
        BlocProvider(
            create: (context) => SetScheduleCubit(getIt.get<DoctorRepoImpl>())),
        BlocProvider(
            create: (context) =>
                MyReservationCubit(getIt.get<DoctorRepoImpl>())),
        BlocProvider(
            create: (context) =>
                AddTestResultCubit(getIt.get<PreservationInfoRepoImpl>())),
        BlocProvider(
            create: (context) => AttachResultCubit(getIt.get<LabRepoImpl>())),
        BlocProvider(
            create: (context) => AdminCubit(getIt.get<AdminRepoImpl>())),
        BlocProvider(
            create: (context) =>
                GetMyFreeTimesDCubit(getIt.get<DoctorRepoImpl>())),
        BlocProvider(
            create: (context) => MyScheduleCubit(getIt.get<DoctorRepoImpl>())),
        BlocProvider(
            create: (context) =>
                UpdateDoctorProfileCubit(getIt.get<DoctorRepoImpl>())),
        BlocProvider(
            create: (context) =>
                UpdatePatientProfileCubit(getIt.get<PofileRepoImpl>())),
        BlocProvider(
            create: (context) =>
                UpdateLabProfileCubit(getIt.get<LabRepoImpl>())),
     
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
