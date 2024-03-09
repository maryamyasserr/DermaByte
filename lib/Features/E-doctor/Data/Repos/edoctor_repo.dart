import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/E-doctor/Data/Models/doctor_reservation_model.dart';
import 'package:flutter/material.dart';

abstract class EdoctorRepo {
  Future<Either<Failures, List<DoctorModel>>> getAllDoctors();
  Future<Either<Failures, DoctorReservationModel>> createReservaion(
      {required dynamic body, @required String? token});
}
