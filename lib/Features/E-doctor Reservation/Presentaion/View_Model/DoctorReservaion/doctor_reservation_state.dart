part of 'doctor_reservation_cubit.dart';

@immutable
sealed class DoctorReservationState {}

final class DoctorReservationInitial extends DoctorReservationState {}

final class DoctorReservationLoading extends DoctorReservationState {}

final class DoctorReservationSuccess extends DoctorReservationState {
  final String successMessage;

  DoctorReservationSuccess({required this.successMessage});
}

final class DoctorReservationFailure extends DoctorReservationState {
  final String errMessage;

  DoctorReservationFailure({required this.errMessage});
}

final class SelectScanSuccess extends DoctorReservationState {
  final List<List<String>> scans;

  SelectScanSuccess({required this.scans});
}

final class SelectScanFailuar extends DoctorReservationState {}
