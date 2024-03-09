import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/E-doctor%20Reservation/Data/Models/doctor_reservation_model.dart';
import 'package:dermabyte/Features/Profile/Data/Models/Report/report_model.dart';
import 'package:dio/dio.dart';

abstract class EdoctorRepo {
  Future<Either<Failures, List<DoctorModel>>> getAllDoctors(
      {required String token});
  Future<Either<Failures, DoctorReservationModel>> createReservaion(
      {required FormData body, required String token});
  Future<Either<Failures, ReportModel>> createrPatientReport(
      {required dynamic body,required String token});
}
