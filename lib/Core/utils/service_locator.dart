import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Appoinments/Data/Repo/preservation_info_repo_impl.dart';
import 'package:dermabyte/Features/Authentication/Data/Repo/auth_repo_impl.dart';
import 'package:dermabyte/Features/E-doctor/Data/Repos/edoctor_repo_impl.dart';
import 'package:dermabyte/Features/E-lab/Data/Repos/lab_repo_impl.dart';
import 'package:dermabyte/Features/E-lab/Presentation/View_model/Lab%20Details%20Cubit/lab_details_cubit.dart';
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
   getIt.registerSingleton<LabRepoImpl>(
    LabRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<EdoctorRepoImpl>(
    EdoctorRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
