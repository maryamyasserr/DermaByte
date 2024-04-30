import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Scan/Data/Models/scan_result.dart';

abstract class ScanRepo {
  Future<Either<Failures, ScanResult>> createScan(
      {required dynamic data, required String token});
}
