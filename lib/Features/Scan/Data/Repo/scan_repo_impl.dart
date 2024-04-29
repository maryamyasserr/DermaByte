import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Scan/Data/Repo/scan_repo.dart';
import 'package:dio/dio.dart';

class ScanRepoImpl implements ScanRepo {
  ScanRepoImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failures, String>> createScan(
      {required dynamic data, required String token}) async {
    try {
      await apiService.postWithMultiForm(
          endPoint: "scans", data: data, token: token);
      return right("Done");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
