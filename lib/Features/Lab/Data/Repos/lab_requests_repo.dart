import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Lab/Data/Models/lab_request/lab_request.dart';

abstract class LabRequestsRepo {
  Future<Either<Failures, List<LabRequest>>> getLabRequests(
      {required String token});
}
