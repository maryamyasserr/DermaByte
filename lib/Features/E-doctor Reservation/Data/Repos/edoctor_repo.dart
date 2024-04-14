import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Models/free_time_model.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:dio/dio.dart';

abstract class EdoctorRepo {
  Future<Either<Failures, List<DoctorModel>>> getAllDoctors(
      {required String token});
  Future<Either<Failures, String>> createReservaionAndPatientReport(
      {required FormData reservationData,
      required dynamic reportData,
      required String token});

  Future<Either<Failures, ReportModel>> createReport(
      {required String token, required dynamic body});

  Future<Either<Failures, List<FreeTimeModel>>> getFreeTime(
      {required dynamic body, required String token});
}
