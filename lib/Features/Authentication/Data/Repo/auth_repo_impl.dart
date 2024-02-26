import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lap_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Repo/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(this.apiService);
  ApiService apiService;
  
  @override
  Future<Either<Failures, LapModel>> signUpAsLap({
    required dynamic data,@required String? token
  }) async {
    try {
      var response =
          await apiService.post(endPoint: 'labs', data: data, token: token);
      LapModel lap=LapModel.fromJson(response);
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
    {required dynamic data,@required String?token}
  )async {
   try {
      var response =
          await apiService.post(endPoint: 'patients', data: data, token: token);
      PatientModel patient=PatientModel.fromJson(response);
      return right(patient);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
  
  @override
  Future<Either<Failures, DoctorModel>> signUpDAsoctor({
    required dynamic data,@required String? token
  })
  async {
    try {
      var response =
          await apiService.post(endPoint: 'dermatologists', data: data, token: token);
      DoctorModel doctor=DoctorModel.fromJson(response);
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
    // TODO: implement signin
    throw UnimplementedError();
  }
}
