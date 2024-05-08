import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Core/utils/routes.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/admin_token.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_token.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_token.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient_token.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/user_model.dart';
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
  Future<Either<Failures, UserModel>> signUp(
      {required dynamic data,
      required String role,
      required BuildContext context}) async {
    String endPoint = 'auth/signup';

    if (role == 'patient') {
      try {
        var response = await apiService.postWithMultiForm(
            endPoint: endPoint, data: data, token: null);
        PatientTokenModel patient = PatientTokenModel.fromJson(response);
        GoRouter.of(context).pushReplacement(AppRoutes.kCustomScreen);
        return right(patient);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioException(e));
        }
        return left(ServerFailure(errMessage: e.toString()));
      }
    } else if (role == 'doctor') {
      try {
        var response = await apiService.postWithMultiForm(
            endPoint: endPoint, data: data, token: null);
        DoctorToken doctor = DoctorToken.fromJson(response);
        GoRouter.of(context).pushReplacement(AppRoutes.kDoctorView);
        return right(doctor);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioException(e));
        }
        return left(ServerFailure(errMessage: e.toString()));
      }
    } else if (role == 'lab') {
      try {
        var response = await apiService.postWithMultiForm(
            endPoint: endPoint, data: data, token: null);
        LabToken lab = LabToken.fromJson(response);
        GoRouter.of(context).pushReplacement(AppRoutes.kLabHome);
        return right(lab);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioException(e));
        }
        return left(ServerFailure(errMessage: e.toString()));
      }
    } else {
      throw Exception("Unsupported Role");
    }
  }
  // @override
  // Future<Either<Failures, LabToken>> signUpAsLap(
  //     {required LabModel data,
  //     @required String? token,
  //     required BuildContext context}) async {
  //   try {
  //     var response = await apiService.post(
  //         endPoint: 'labs', data: data.toJson(), token: token);
  //     debugPrint("${response['data']}");
  //     LabToken lab = LabToken.fromJson(response);
  //     GoRouter.of(context).pushReplacement(AppRoutes.kLabHome);
  //     return right(lab);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioException(e));
  //     }
  //     return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failures, PatientTokenModel>> signUpAsPatient(
  //     {required dynamic data,
  //     @required String? token,
  //     required BuildContext context}) async {
  //   try {
  //     var response = await apiService.post(
  //         endPoint: 'patients', data: data.toJson(), token: token);
  //     PatientTokenModel patient = PatientTokenModel.fromJson(response);
  //     GoRouter.of(context).pushReplacement(AppRoutes.kCustomScreen);
  //     return right(patient);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioException(e));
  //     }
  //     return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failures, DoctorToken>> signUpAsDsoctor(
  //     {required dynamic data,
  //     @required String? token,
  //     required BuildContext context}) async {
  //   try {
  //     var response = await apiService.post(
  //         endPoint: 'dermatologists', data: data.toJson(), token: token);
  //     debugPrint("$response");
  //     DoctorToken doctor = DoctorToken.fromJson(response['data']);
  //     GoRouter.of(context).pushReplacement(AppRoutes.kDoctorView);
  //     return right(doctor);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioException(e));
  //     }
  //     return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }

  @override
  Future<Either<Failures, UserModel>> signIn({
    required dynamic body,
    required BuildContext context,
  }) async {
    try {
      var response =
          await apiService.post(endPoint: 'auth/login', data: body, token: '');
      if (response['data']['role'] == 'patient') {
        PatientTokenModel patient = PatientTokenModel.fromJson(response);
        GoRouter.of(context).push(AppRoutes.kCustomScreen);
        return right(patient);
      } else if (response['data']['role'] == 'dermatologist') {
        DoctorToken doctor = DoctorToken.fromJson(response);
        GoRouter.of(context).push(AppRoutes.kDoctorView);
        return right(doctor);
      } else if (response['data']['role'] == 'lab') {
        LabToken lab = LabToken.fromJson(response);
        GoRouter.of(context).push(AppRoutes.kLabHome);
        return right(lab);
      } else if (response['data']['role'] == 'admin') {
        AdminToken lab = AdminToken.fromJson(response);
        GoRouter.of(context).push(AppRoutes.kAdminView);
        return right(lab);
      } else {
        throw Exception("Unsupported type");
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
