import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Models/doctor_reservation_model.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Repos/edoctor_repo.dart';
import 'package:dio/dio.dart';

class EdoctorRepoImpl implements EdoctorRepo {
  EdoctorRepoImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failures, List<DoctorModel>>> getAllDoctors(
      {required String token}) async {
    try {
      var response =
          await apiService.get(endPoint: 'dermatologists', token: token);
      List<DoctorModel> doctors = [];
      for (var doctor in response['data']) {
        doctors.add(DoctorModel.fromJson(doctor));
      }
      return (right(doctors));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, DoctorReservationModel>> createReservaion(
      {required FormData body, String? token}) async {
    try {
      var response = await apiService.postWithMultiForm(
          endPoint: "Dermatologist-reservation", data: body, token: token);
      DoctorReservationModel doctorReservation =
          DoctorReservationModel.fromJson(response["data"]);
      return right(doctorReservation);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

}
