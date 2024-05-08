import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Admin/Data/Models/doctor_dash.dart';
import 'package:dermabyte/Features/Admin/Data/Models/lab_dash/lab_dash.dart';
import 'package:dermabyte/Features/Admin/Data/Models/patient_dash.dart';
import 'package:dermabyte/Features/Admin/Data/Repo/admin_repo.dart';
import 'package:dio/dio.dart';

class AdminRepoImpl implements AdminRepo {
  AdminRepoImpl(this.apiService);

  ApiService apiService;
  @override
  Future<Either<Failures, List<DoctorDash>>> getAllDoctorsDash(
      {required String token, required String state}) async {
    try {
      var response =
          await apiService.get(endPoint: 'dermatologists', token: token);
      List<DoctorDash> doctors = [];
      for (var d in response['data']) {
        doctors.add(DoctorDash.fromJson(d));
      }
      return right(doctors);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<LabDash>>> getAllLabsDash(
      {required String token, required String state}) async {
    try {
      var response = await apiService.get(endPoint: 'labs', token: token);
      List<LabDash> labs = [];
      for (var l in response['data']) {
        labs.add(LabDash.fromJson(l));
      }
      return right(labs);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<PatientDash>>> getAllPatientsDash(
      {required String token}) async {
    try {
      var response = await apiService.get(endPoint: 'patients', token: token);
      List<PatientDash> patients = [];
      for (var p in response['data']) {
        patients.add(PatientDash.fromJson(p));
      }
      return right(patients);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> deletePatient(
      {required String token, required String id}) async {
    try {
      await apiService.delete(endPoint: 'patients/', id: id, token: token);
      return right("Done");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> deleteDoctor(
      {required String token, required String id}) async {
    try {
      await apiService.delete(
          endPoint: 'dermatologists/', id: id, token: token);
      return right('Done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> deleteLab(
      {required String token, required String id}) async {
    try {
      await apiService.delete(endPoint: 'labs/', id: id, token: token);
      return right('Done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> approve(
      {required String token, required body}) async {
    try {
      await apiService.update(
          endPoint: 'admin/Approve', data: body, token: token);
      return right('Done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> decline(
      {required String token, required body}) async {
    try {
      await apiService.deleteWithBody(
          endPoint: 'admin/Decline', body: body, token: token);
      return right('Done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
