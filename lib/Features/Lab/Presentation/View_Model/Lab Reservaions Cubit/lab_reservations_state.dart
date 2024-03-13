part of 'lab_reservations_cubit.dart';

@immutable
sealed class LabReservationsState {}

final class LabReservaionsInitial extends LabReservationsState {}

final class LabReservaionsLoading extends LabReservationsState {}

final class LabReservaionsFailure extends LabReservationsState {
  final String errMessage;
  LabReservaionsFailure({required this.errMessage});
}

final class LabReservaionsSuccess extends LabReservationsState {
  final List<LabReservations> labRequests;
  LabReservaionsSuccess({required this.labRequests});
}
