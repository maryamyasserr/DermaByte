import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Admin/Data/Repo/admin_repo_impl.dart';
import 'package:dermabyte/Features/Authentication/Data/Repo/auth_repo_impl.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/doctor_repo_impl.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Repos/edoctor_repo_impl.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/elab_repo_impl.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo_impl.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo_impl.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/Profle%20Repo/profile_repo_impl.dart';
import 'package:dermabyte/Features/Scan/Data/Repo/scan_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<PreservationInfoRepoImpl>(
    PreservationInfoRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<PofileRepoImpl>(
      PofileRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<ElabRepoImpl>(
    ElabRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<EdoctorRepoImpl>(
    EdoctorRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<LabRepoImpl>(
    LabRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<DoctorRepoImpl>(
      DoctorRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<ScanRepoImpl>(ScanRepoImpl(getIt.get<ApiService>()));
  getIt
      .registerSingleton<AdminRepoImpl>(AdminRepoImpl(getIt.get<ApiService>()));
}
