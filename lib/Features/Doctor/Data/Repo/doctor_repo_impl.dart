import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/doctor_schedule_model.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/my_free_time_model.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/p_reservation/p_reservation.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorRepoImpl implements DoctorRepo {
  DoctorRepoImpl(this.apiService);
  ApiService apiService;

  @override
  Future<Either<Failures, List<ReportModel>>> getMyPatientsReports(
      {required String token}) async {
    try {
      var response = await apiService.get(
          endPoint: 'dermatologists/reports', token: token);
      List<ReportModel> myReport = [];
      for (var element in response['data']) {
        myReport.add(ReportModel.fromJson(element));
      }
      return right(myReport);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ReportModel>> updatePatientReport(
      {required String id,
      token,
      required body,
      required BuildContext context}) async {
    try {
      var response = await apiService.update(
          endPoint: "reports/$id/test", data: body, token: token);
      ReportModel report = ReportModel.fromJson(response['data']);
      GoRouter.of(context).pop();
      return right(report);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      GoRouter.of(context).pop();
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> setSchedule(
      {required dynamic body, required String token}) async {
    try {
      await apiService.post(endPoint: "schedules", data: body, token: token);
      return right("Success");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<MyReservaionModel>>> getMyReservation(
      {required String token,
      required String reviewd,
      required String completed}) async {
    try {
      var response = await apiService.get(
          endPoint:
              'dermatologists/Dermatologist-reservation?reviewed=$reviewd&completed=$completed',
          token: token);
      List<MyReservaionModel> myReservations = [];
      for (var element in response['data']) {
        myReservations.add(MyReservaionModel.fromJson(element));
      }
      return right(myReservations);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> deleteTest(
      {required String id, required String token}) {
    // TODO: implement deleteTest
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> reviewdPatient(
      {required String id, required String token, required body}) async {
    try {
      await apiService.update(
          endPoint: "Dermatologist-reservation/$id", data: body, token: token);
      return right("Done");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<MyFreeTimeModel>>> getMyFreeTimesD(
      {required String token}) async {
    try {
      var response = await apiService.get(
          endPoint: 'dermatologists/myFreeTime', token: token);
      List<MyFreeTimeModel> freeTimes = [];
      for (var e in response['data']) {
        freeTimes.add(MyFreeTimeModel.fromJson(e));
      }
      return right(freeTimes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> deleteScheduleDay(
      {required String token, required String id}) async {
    try {
      await apiService.delete(endPoint: 'schedules/', id: id, token: token);
      return right('Done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<DoctorScheduleModel>>> getMySchedule(
      {required String token}) async {
    try {
      var response = await apiService.get(
          endPoint: 'dermatologists/schedules', token: token);
      List<DoctorScheduleModel> schedules = [];
      for (var e in response['data']) {
        schedules.add(DoctorScheduleModel.fromJson(e));
      }
      return right(schedules);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> updateSchedule(
      {required String token, required String id, required body}) async {
    try {
      await apiService.updateWithId(
          endPoint: 'schedules/', data: body, id: id, token: token);
      return right('done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> deletePatinetReservation(
      {required String token, required String id}) async {
    try {
      await apiService.delete(
          endPoint: 'Dermatologist-reservation/', id: id, token: token);
      return right("Done");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> updateDoctorProfile(
      {required String token, required body}) async {
    try {
      await apiService.updateWithMultipart(
          endPoint: 'dermatologists/updateMe', data: body, token: token);
      return right('done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> changeDoctorPassword(
      {required String token, required body}) async {
    try {
      await apiService.update(
          endPoint: 'dermatologists/changeMyPassword',
          data: body,
          token: token);
      return right('done');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
