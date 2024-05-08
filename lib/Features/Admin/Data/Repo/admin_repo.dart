import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Admin/Data/Models/doctor_dash.dart';
import 'package:dermabyte/Features/Admin/Data/Models/lab_dash/lab_dash.dart';
import 'package:dermabyte/Features/Admin/Data/Models/patient_dash.dart';

abstract class AdminRepo {
  Future<Either<Failures, List<PatientDash>>> getAllPatientsDash(
      {required String token});
  Future<Either<Failures, List<DoctorDash>>> getAllDoctorsDash(
      {required String token, required String state});
  Future<Either<Failures, List<LabDash>>> getAllLabsDash(
      {required String token, required String state});

  Future<Either<Failures, String>> deletePatient(
      {required String token, required String id});
  Future<Either<Failures, String>> deleteDoctor(
      {required String token, required String id});
  Future<Either<Failures, String>> deleteLab(
      {required String token, required String id});
  Future<Either<Failures, String>> approve({
    required String token,
    required dynamic body,
  });

  Future<Either<Failures, String>> decline(
      {required String token, required dynamic body});
}
