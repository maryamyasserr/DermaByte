import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/lab_reservations.dart';
import 'package:dermabyte/Features/Lab/Data/Models/service_model.dart';
import 'package:dermabyte/Features/Lab/Data/Repos/lab_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class LabRepoImpl implements LabRepo {
  ApiService apiService;
  LabRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<LabReservations>>> getLabRequests(
      {required String token}) async {
    try {
      var response = await apiService.get(
          endPoint: "labs/laboratory-reservation?completed=false",
          token: token);
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
  Future<Either<Failures, String>> addService(
      {required String token,
      required body,
      required BuildContext context}) async {
    try {
      await apiService.post(endPoint: 'labs/tests', data: body, token: token);
      GoRouter.of(context).pop();
      return right("Done");
    } catch (e) {
      if (e is DioException) {
        GoRouter.of(context).pop();
        return left(ServerFailure.fromDioException(e));
      } else {
        GoRouter.of(context).pop();
        return left(ServerFailure(errMessage: e.toString()));
      }
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

  @override
  Future<Either<Failures, String>> attachResult(
      {required String token,
      required body,
      required BuildContext context}) async {
    try {
      await apiService.postWithMultiForm(
          endPoint: "results", data: body, token: token);
      GoRouter.of(context).pop();
      return right("Done");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> deleteLabRequest(
      {required String token,
      required String id,
      required dynamic body}) async {
    try {
      await apiService.update(
          endPoint: 'laboratories-reservations/$id', token: token, data: body);
      return right('dnoe');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
