import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/preservation_model/preservation_model.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';

abstract class PreservationInfoRepo {
  Future<Either<Failures, List<PreservationModel>>> getPatientReservation(
      {required String token});
  Future<Either<Failures, ReportModel>> addTestResult(
      {required String id, token, required dynamic body});
}
