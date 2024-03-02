import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Profile/Data/Models/scan.dart';

abstract class HistoryRepo {
  Future<Either<Failures, List<ScanModel>>> getPatientScan(
      {required String id});
}
