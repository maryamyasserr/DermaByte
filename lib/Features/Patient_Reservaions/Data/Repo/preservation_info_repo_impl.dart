import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/lab_reseervation_model/lab_reseervation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/preservation_model/preservation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Repo/preservation_info_repo.dart';
import 'package:dio/dio.dart';

class PreservationInfoRepoImpl implements PreservationInfoRepo {
  PreservationInfoRepoImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failures, List<PreservationModel>>> getPatientDoctorReservation(
      {required String token}) async {
    try {
      var response = await apiService.get(
          endPoint: 'patients/Patient-reservation', token: token);
      List<PreservationModel> preservation = [];
      for (var item in response['data']) {
        preservation.add(PreservationModel.fromJson(item));
      }
      return right(preservation);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> addTestResult(
      {required String id, required String token, required body}) async {
    try {
      await apiService.update(
          endPoint: "reports/$id", data: body, token: token);

      return right('done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> deleteDoctorReservation(
      {required String token, required String id}) async {
    try {
      await apiService.delete(
          endPoint: "Dermatologist-reservation/", id: id, token: token);
      return right("Done");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> uploadTestResult(
      {required String id, required String token, required body}) async {
    try {
      await apiService.updateWithMultipart(
          endPoint: 'reports/$id/uploadTestResult', data: body, token: token);
      return right('done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> updateSessionDate(
      {required String token, required String id, required body}) async {
    try {
      await apiService.updateWithId(
          endPoint: 'Dermatologist-reservation/',
          data: body,
          id: id,
          token: token);
      return right("Done");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<PLabReservationModel>>> getPatientLabReservation(
      {required String token}) async {
    try {
      var response = await apiService.get(
          endPoint: 'patients/laboratory-reservation', token: token);
      List<PLabReservationModel> reservations = [];
      for (var e in response['data']) {
        reservations.add(PLabReservationModel.fromJson(e));
      }
      return right(reservations);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
  
  @override
  Future<Either<Failures, String>> deletePLabReservation({required String token, required String id})async {
     try {
      await apiService.delete(
          endPoint: "laboratories-reservations/", id: id, token: token);
      return right("Done");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
