import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model.dart';

import 'package:dermabyte/Features/Authentication/Data/Models/patient_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Repo/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this.apiService);
  ApiService apiService;

  @override
  Future<Either<Failures, LabModel>> signUpAsLap(
      {required LabModel data,
      @required String? token,
      required BuildContext context}) async {
    try {
      var response = await apiService.post(
          endPoint: 'labs', data: data.toJson(), token: token);
      debugPrint("${response['data']}");
      LabModel lap = LabModel.fromJson(response['data']);
      GoRouter.of(context).pushReplacement(AppRoutes.kElabHome);
      return right(lap);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, PatientModel>> signUpAsPatient(
      {required PatientModel data,
      @required String? token,
      required BuildContext context}) async {
    try {
      var response = await apiService.post(
          endPoint: 'patients', data: data.toJson(), token: token);
      PatientModel patient = PatientModel.fromJson(response['data']);
      GoRouter.of(context).pushReplacement(AppRoutes.kCustomScreen);
      return right(patient);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, DoctorModel>> signUpAsDsoctor(
      {required DoctorModel data,
      @required String? token,
      required BuildContext context}) async {
    try {
      var response = await apiService.post(
          endPoint: 'dermatologists', data: data.toJson(), token: token);
      debugPrint("$response");
      DoctorModel doctor = DoctorModel.fromJson(response['data']);
      GoRouter.of(context).pushReplacement(AppRoutes.kEdoctor);
      GoRouter.of(context).pushReplacement(AppRoutes.kEdoctor);
      return right(doctor);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> signin() {
    throw UnimplementedError();
  }
}
