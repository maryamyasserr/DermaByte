import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';

abstract class ScanRepo {
  Future<Either<Failures, String>> createScan(
      {required dynamic data, required String token});
}
