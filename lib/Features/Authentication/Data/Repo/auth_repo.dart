import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lap_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient_model.dart';
import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future<Either<Failures, void>> signin();
  Future<Either<Failures, PatientModel>> signUpAsPatient(
      {required dynamic data, @required String? token});
  Future<Either<Failures, DoctorModel>> signUpAsDsoctor(
      {required dynamic data, @required String? token});
  Future<Either<Failures, LabModel>> signUpAsLap(
      {required dynamic data, @required String? token});
}
