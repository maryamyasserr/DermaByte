part of 'scan_cubit.dart';

@immutable
sealed class ScanState {}

final class ScanInitial extends ScanState {}

final class ScanLoading extends ScanState {}

final class ScanFailure extends ScanState {
  final String errMessage;

  ScanFailure({required this.errMessage});
}

final class ScanSuccess extends ScanState {
  final List<ScanModel> scans;

  ScanSuccess({required this.scans});
}
