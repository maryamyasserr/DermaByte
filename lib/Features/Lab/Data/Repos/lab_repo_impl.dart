import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/lab_reservations.dart';
import 'package:dermabyte/Features/Lab/Data/Models/service_model.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LabRepoImpl implements LabRepo {
  ApiService apiService;
  LabRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<LabReservations>>> getLabRequests(
      {required String token}) async {
    try {
      var response = await apiService.get(
          endPoint: "labs/laboratory-reservation", token: token);
      List<LabReservations> labs = [];
      for (var lab in response['data']) {
        labs.add(LabReservations.fromJson(lab));
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
  Future<Either<Failures, ServiceModel>> addService(
      {required String token,
      required body,
      required BuildContext context}) async {
    try {
      var response = await apiService.post(
          endPoint: 'labs/tests', data: body, token: token);
      ServiceModel service = ServiceModel.fromJson(response['data']);
      GoRouter.of(context).pop();
      return right(service);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<ServiceModel>>> getMyServices(
      {required String token}) async {
    try {
      var response = await apiService.get(endPoint: 'labs/tests', token: token);
      List<ServiceModel> services = [];
      for (var service in response['data']) {
        services.add(ServiceModel.fromJson(service));
      }
      return right(services);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
