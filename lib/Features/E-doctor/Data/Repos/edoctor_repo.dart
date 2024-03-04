import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/doctor_model.dart';

abstract class EdoctorRepo {
  Future<Either<Failures, List<DoctorModel>>> getAllDoctors();
}
