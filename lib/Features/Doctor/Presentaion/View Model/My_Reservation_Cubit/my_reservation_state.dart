part of 'my_reservation_cubit.dart';

@immutable
sealed class MyReservationState {}

final class MyReservationInitial extends MyReservationState {}

final class MyReservationLoading extends MyReservationState {}

final class ViewPatientState extends MyReservationState {}

final class MyReservationSuccess extends MyReservationState {
  final List<MyReservaionModel>? reservation;

  MyReservationSuccess({this.reservation});
}

final class MyAppoinmentsSuccess extends MyReservationState {
  final List<MyReservaionModel> appoinments;

  MyAppoinmentsSuccess({required this.appoinments});

  get reservations => null;
}

final class MyReservationFailure extends MyReservationState {
  final String errMessage;

  MyReservationFailure({required this.errMessage});
}
