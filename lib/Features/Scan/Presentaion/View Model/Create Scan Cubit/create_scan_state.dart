part of 'create_scan_cubit.dart';

@immutable
sealed class CreateScanState {}

final class CreateScanInitial extends CreateScanState {}

final class CreateScanLoading extends CreateScanState {}

final class CreateScanSuccess extends CreateScanState {
  final ScanResult scanResult;

  CreateScanSuccess({required this.scanResult});
}

final class CreateScanFailuer extends CreateScanState {
  final String errMessage;

  CreateScanFailuer({required this.errMessage});
}
