import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/lab_reseervation_model/lab_reseervation_model.dart';
import 'package:dermabyte/Features/Patient_Reservaions/Data/Models/preservation_model/preservation_model.dart';

abstract class PreservationInfoRepo {
  Future<Either<Failures, List<PreservationModel>>> getPatientDoctorReservation(
      {required String token});
  Future<Either<Failures, String>> addTestResult(
      {required String id, required String token, required dynamic body});
  Future<Either<Failures, String>> uploadTestResult(
      {required String id, required String token, required dynamic body});

  Future<Either<Failures, String>> deleteDoctorReservation(
      {required String token, required String id});
  Future<Either<Failures, String>> updateSessionDate(
      {required String token, required String id, required dynamic body});
  Future<Either<Failures, List<PLabReservationModel>>> getPatientLabReservation(
      {required String token});
  Future<Either<Failures, String>> deletePLabReservation(
      {required String token, required String id});
}
