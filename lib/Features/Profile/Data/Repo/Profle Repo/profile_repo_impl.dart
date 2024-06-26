import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:dermabyte/Features/Profile/Data/Models/test_model/test_model.dart';
import 'package:dermabyte/Features/Profile/Data/Repo/Profle%20Repo/profile_repo.dart';
import 'package:dermabyte/Features/Profile/Data/Models/scan.dart';
import 'package:dio/dio.dart';

class PofileRepoImpl implements ProfileRepo {
  ApiService apiService;
  PofileRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<ScanModel>>> getPatientScans(
      {required String token}) async {
    try {
      var response =
          await apiService.get(endPoint: 'patients/scans', token: token);
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
      {required String token}) async {
    try {
      var response =
          await apiService.get(endPoint: "patients/results", token: token);
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

  @override
  Future<Either<Failures, List<ReportModel>>> getPatientConsults(
      {required String token}) async {
    try {
      var response =
          await apiService.get(endPoint: "patients/reports", token: token);
      List<ReportModel> consults = [];
      for (var consultaion in response['data']) {
        consults.add(ReportModel.fromJson(consultaion));
      }
      return right(consults);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> updatePatientProfile(
      {required String token, required body}) async {
    try {
      await apiService.update(
          endPoint: 'patients/updateMe', data: body, token: token);
      return right('done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> changePatientPassword(
      {required String token, required body}) async {
    try {
      await apiService.update(
          endPoint: 'patients/changeMyPassword', data: body, token: token);
      return right('done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
