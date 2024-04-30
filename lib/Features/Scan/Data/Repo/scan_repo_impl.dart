import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Scan/Data/Models/scan_result.dart';
import 'package:dermabyte/Features/Scan/Data/Repo/scan_repo.dart';
import 'package:dio/dio.dart';

class ScanRepoImpl implements ScanRepo {
  ScanRepoImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failures, ScanResult>> createScan(
      {required dynamic data, required String token}) async {
    try {
      var response = await apiService.postWithMultiForm(
          endPoint: "scans", data: data, token: token);
      ScanResult scan = ScanResult.fromJson(response['data']);
      return right(scan);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
