part of 'delete_reservation_cubit.dart';

@immutable
sealed class DeleteReservationState {}

final class DeleteReservationInitial extends DeleteReservationState {}

final class DeleteReservationLoading extends DeleteReservationState {}

final class DeleteReservationSuccess extends DeleteReservationState {
  final String successMessage;

  DeleteReservationSuccess({required this.successMessage});
}

final class DeleteReservationFailure extends DeleteReservationState {
  final String errMessage;

  DeleteReservationFailure({required this.errMessage});
}
