import 'package:dartz/dartz.dart';
import 'package:dermabyte/Core/errors/failures.dart';
import 'package:dermabyte/Features/Profile/Data/Models/report_model/report_model.dart';
import 'package:dermabyte/Features/Profile/Data/Models/scan.dart';
import 'package:dermabyte/Features/Profile/Data/Models/test_model/test_model.dart';

abstract class HistoryRepo {
  Future<Either<Failures, List<ScanModel>>> getPatientScans(
      {required String token});
  Future<Either<Failures, List<TestModel>>> getPatientTests(
      {required String token});
  Future<Either<Failures, List<ReportModel>>> getPatientConsults(
      {required String token});
}
