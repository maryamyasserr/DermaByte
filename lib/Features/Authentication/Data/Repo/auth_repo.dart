import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient_token.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AuthRepo {
  Future<Either<Failures, void>> signin();
  Future<Either<Failures, PatientTokenModel>> signUpAsPatient(
      {required PatientModel data,
      @required String? token,
      required BuildContext context});
  Future<Either<Failures, DoctorModel>> signUpAsDsoctor(
      {required DoctorModel data,
      @required String? token,
      required BuildContext context});
  Future<Either<Failures, LabModel>> signUpAsLap(
      {required LabModel data,
      @required String? token,
      required BuildContext context});
  Future<Either<Failures, PatientTokenModel>> signInAsPatient(
      {required dynamic body, required BuildContext context});
}
