part of 'patiaent_lab_reservation_cubit.dart';

@immutable
sealed class PatientLabReservationState {}

final class PatiaentLabReservationInitial extends PatientLabReservationState {}

final class PatiaentLabReservationLoading extends PatientLabReservationState {}

final class PatiaentLabReservationSuccess extends PatientLabReservationState {
  final List<PLabReservationModel> reservations;

  PatiaentLabReservationSuccess({required this.reservations});
}

final class PatiaentLabReservationFailure extends PatientLabReservationState {
  final String errMessage;

  PatiaentLabReservationFailure({required this.errMessage});
}
