import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_reservations/lab_reservations.dart';
import 'package:dermabyte/Features/Lab/Data/Models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class LabRepo {
  Future<Either<Failures, List<LabReservations>>> getLabRequests(
      {required String token});

  Future<Either<Failures, String>> deleteLabRequest(
      {required String token, required String id});

  Future<Either<Failures, String>> addService(
      {required String token,
      required dynamic body,
      required BuildContext context});

  Future<Either<Failures, List<ServiceModel>>> getMyServices(
      {required String token});

  Future<Either<Failures, String>> attachResult(
      {required String token,
      required dynamic body,
      required BuildContext context});
  Future<Either<Failures, String>> deleteTest(
      {required String token, required String id});

  Future<Either<Failures, String>> updateTest(
      {required String token, required String id, required dynamic body});
  Future<Either<Failures, String>> updateLabProfile(
      {required String token, required dynamic body});
  Future<Either<Failures, String>> changeLabPassword(
      {required String token, required dynamic body});
}
