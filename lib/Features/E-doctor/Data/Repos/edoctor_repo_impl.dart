import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Core/utils/api_service.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/E-doctor/Data/Repos/edoctor_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EdoctorRepoImpl implements EdoctorRepo {
  EdoctorRepoImpl(this.apiService);
  ApiService apiService;
  @override
  Future<Either<Failures, List<DoctorModel>>> getAllDoctors() async {
    try {
      var response = await apiService.get(endPoint: 'dermatologists');
      debugPrint("${response['data']}");
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
}
