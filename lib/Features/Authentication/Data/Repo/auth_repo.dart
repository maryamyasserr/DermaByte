import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserModel>> signUp(
      {required dynamic data,
      required String role,
      required BuildContext context});

  // Future<Either<Failures, PatientTokenModel>> signUpAsPatient(
  //     {required dynamic data,
  //     @required String? token,
  //     required BuildContext context});
  // Future<Either<Failures, DoctorToken>> signUpAsDsoctor(
  //     {required dynamic data,
  //     @required String? token,
  //     required BuildContext context});
  // Future<Either<Failures, LabToken>> signUpAsLap(
  //     {required LabModel data,
  //     @required String? token,
  //     required BuildContext context});

  Future<Either<Failures, UserModel>> signIn({
    required dynamic body,
    required BuildContext context,
  });
}
