import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Authentication/Data/Models/lap_model.dart';

abstract class LabRepo {
  Future<Either<Failures, List<LabModel>>> getAllLabs();
  Future<Either<Failures, LabModel>> getLabDetails({required id});
}
