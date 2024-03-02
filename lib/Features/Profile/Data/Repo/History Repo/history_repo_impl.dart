import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Profile/Data/Models/test_model/test_model.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/History%20Repo/history_repo.dart';
import 'package:dermabyte/Features/Profile/Data/Models/scan.dart';
import 'package:dio/dio.dart';

class HistoryRepoImpl implements HistoryRepo {
  ApiService apiService;
  HistoryRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<ScanModel>>> getPatientScans(
      {required String id}) async {
    try {
      var response = await apiService.get(endPoint: 'patients/$id/scans');
      List<ScanModel> scans = [];
      for (var scan in response['data']) {
        scans.add(ScanModel.fromJson(scan));
      }
      return right(scans);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<TestModel>>> getPatientTests(
      {required String id}) async {
    try {
      var response = await apiService.get(endPoint: "patients/$id/results");
      List<TestModel> patientTests = [];
      for (var test in response['data']) {
        patientTests.add(TestModel.fromJson(test));
      }
      return right(patientTests);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}