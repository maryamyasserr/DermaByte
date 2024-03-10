part of 'my_reservation_cubit.dart';

@immutable
sealed class MyReservationState {}

final class MyReservationInitial extends MyReservationState {}

final class MyReservationLoading extends MyReservationState {}

final class MyReservationSuccess extends MyReservationState {
  final List<MyReservaionModel> reservations;

  MyReservationSuccess({required this.reservations});
}

final class MyReservationFailure extends MyReservationState {
  final String errMessage;

  MyReservationFailure({required this.errMessage});
}
