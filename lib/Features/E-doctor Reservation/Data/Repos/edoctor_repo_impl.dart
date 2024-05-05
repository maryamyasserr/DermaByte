import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Models/free_time_model.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Repos/edoctor_repo.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EdoctorRepoImpl implements EdoctorRepo {
  EdoctorRepoImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failures, List<DoctorModel>>> getAllDoctors(
      {required String token}) async {
    try {
      var response = await apiService.get(
          endPoint: 'dermatologists?state=true', token: token);
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
  Future<Either<Failures, String>> createReservaionAndPatientReport(
      {required dynamic reservationData,
      // required reportData,
      required BuildContext context,
      required String token}) async {
    try {
      var reservationResponse = await apiService.getWithBody(
          endPoint: "bookings/checkout-session",
          body: reservationData,
          token: token);
      // await apiService.post(
      //     endPoint: "reports", data: reportData, token: token);

      // GoRouter.of(context).pop();
      return right(reservationResponse['session']['url']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ReportModel>> createReport(
      {required String token, required dynamic body}) async {
    try {
      var response =
          await apiService.post(endPoint: 'reports', data: body, token: token);
      ReportModel reportModel = ReportModel.fromJson(response['data']);
      return right(reportModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<FreeTimeModel>>> getFreeTime(
      {required body, required String token}) async {
    try {
      var response = await apiService.getWithBody(
          endPoint: 'schedules/Freetimes', body: body, token: token);
      List<FreeTimeModel> freeTimes = [];
      for (var i in response['data']) {
        freeTimes.add(FreeTimeModel.fromJson(i));
      }
      return right(freeTimes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  // @override
  // Future<Either<Failures, DoctorReservationModel>> createReservaion(
  //     {required FormData body, String? token}) async {
  //   try {
  //     var response = await apiService.postWithMultiForm(
  //         endPoint: "Dermatologist-reservation", data: body, token: token);
  //     DoctorReservationModel doctorReservation =
  //         DoctorReservationModel.fromJson(response["data"]);
  //     return right(doctorReservation);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioException(e));
  //     }
  //     return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }
}
