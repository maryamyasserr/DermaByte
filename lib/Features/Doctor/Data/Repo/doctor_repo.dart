import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/my_reservaion_model/my_reservaion_model.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:flutter/material.dart';

abstract class DoctorRepo {
  Future<Either<Failures, List<MyReservaionModel>>> getMyReservation(
      {required String token, required String reviewd});

  Future<Either<Failures, List<ReportModel>>> getMyPatientsReports(
      {required String token});

  Future<Either<Failures, ReportModel>> updatePatientReport(
      {required String id,
      token,
      required dynamic body,
      required BuildContext context});
  Future<Either<Failures, String>> deleteTest(
      {required String id, required String token});

  Future<Either<Failures, String>> setSchedule(
      {required dynamic body, required String token});
}
