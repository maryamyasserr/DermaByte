import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model.dart';
import 'package:dermabyte/Features/E-lab/Data/Models/lab_reservation.dart';
import 'package:flutter/material.dart';

abstract class LabRepo {
  Future<Either<Failures, List<LabModel>>> getAllLabs({required String token});
  Future<Either<Failures, LabReservationModel>> createReservation(
      {required dynamic body, @required String? token});
}
