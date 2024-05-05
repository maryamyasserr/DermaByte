import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/preservation_model/preservation_model.dart';

abstract class PreservationInfoRepo {
  Future<Either<Failures, List<PreservationModel>>> getPatientReservation(
      {required String token});
  Future<Either<Failures, String>> addTestResult(
      {required String id, required String  token, required dynamic body});
    Future<Either<Failures, String>> uploadTestResult(
      {required String id, required String token, required dynamic body});

  Future<Either<Failures, String>> deleteReservation(
      {required String token, required String id});
}
