import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/my_reservaion_model/my_reservaion_model.dart';
import 'package:dermabyte/Features/Doctor/Data/Repo/Doctor_repo.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorRepoImpl implements DoctorRepo {
  DoctorRepoImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failures, List<MyReservaionModel>>> getMyReservation(
      {required String token}) async {
    try {
      var response = await apiService.get(
          endPoint: 'dermatologists/Dermatologist-reservation', token: token);
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
  Future<Either<Failures, ReportModel>> requestTests({
    required String id, token, required body, required BuildContext context}) async {
   try {
      var response = await apiService.update(
          endPoint: "reports/$id", data: body, id: id, token: token);
      ReportModel report = ReportModel.fromJson(response['data']);
      GoRouter.of(context).pop();
      return right(report);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }


}
