import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lap_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient_model.dart';
import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future<Either<Failures,void>> signin();
  Future<Either<Failures,PatientModel>>signUpAsPatient({
    required String data,@required String?token
  });
  Future<Either<Failures,DoctorModel>>signUpDAsoctor({required String data,@required String?token});
  Future<Either<Failures,LapModel>>signUpAsLap({required String data,@required String?token});
}
