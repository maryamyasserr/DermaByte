import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Appoinments/Data/Repo/preservation_info_repo_impl.dart';
import 'package:dermabyte/Features/Authentication/Data/Repo/auth_repo_impl.dart';
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
}
