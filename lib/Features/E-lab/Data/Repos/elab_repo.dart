import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lab_model/lab_model.dart';

abstract class ElabRepo {
  Future<Either<Failures, List<LabModel>>> getAllLabs({required String token});
  Future<Either<Failures, String>> createReservation(
      {required dynamic body, required String token});
}
