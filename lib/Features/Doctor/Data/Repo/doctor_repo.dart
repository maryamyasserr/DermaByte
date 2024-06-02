import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/doctor_schedule_model.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/my_free_time_model.dart';
import 'package:dermabyte/Features/Doctor/Data/Models/p_reservation/p_reservation.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:flutter/material.dart';

abstract class DoctorRepo {
  Future<Either<Failures, List<MyReservaionModel>>> getMyReservation(
      {required String token,
      required String reviewd,
      required String completed});

  Future<Either<Failures, List<ReportModel>>> getMyPatientsReports(
      {required String token});

  Future<Either<Failures, ReportModel>> updatePatientReport(
      {required String id,
      token,
      required dynamic body,
      required BuildContext context});
  Future<Either<Failures, String>> reviewdPatient(
      {required String id, required String token, required dynamic body});
  Future<Either<Failures, String>> deleteTest(
      {required String id, required String token});

  Future<Either<Failures, String>> setSchedule(
      {required dynamic body, required String token});
  Future<Either<Failures, List<MyFreeTimeModel>>> getMyFreeTimesD(
      {required String token});
  Future<Either<Failures, String>> deleteScheduleDay(
      {required String token, required String id});
  Future<Either<Failures, List<DoctorScheduleModel>>> getMySchedule(
      {required String token});
  Future<Either<Failures, String>> updateSchedule(
      {required String token, required String id, required dynamic body});
  Future<Either<Failures, String>> deletePatinetReservation(
      {required String token, required String id});
  Future<Either<Failures, String>> updateDoctorProfile(
      {required String token, required dynamic body});
}
