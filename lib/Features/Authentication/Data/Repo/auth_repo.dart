import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lap_model.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/patient_model.dart';

abstract class AuthRepo {
  Future<Either<Failures,void>> signin();
  Future<Either<Failures,List<PatientModel>>>signUpAsPatient();
  Future<Either<Failures,List<DoctorModel>>>signUpDAsoctor();
  Future<Either<Failures,List<LapModelg>>>signUpAsLap();
}
