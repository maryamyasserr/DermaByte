import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Scan/Data/scan.dart';

abstract class ScanRepo {
  Future<Either<Failures, List<ScanModel>>> getPatientScan(
      {required String id});
}
