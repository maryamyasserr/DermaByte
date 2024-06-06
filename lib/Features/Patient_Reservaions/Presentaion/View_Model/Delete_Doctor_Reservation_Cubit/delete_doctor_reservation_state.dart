part of 'delete_doctor_reservation_cubit.dart';

@immutable
sealed class DeleteDoctorReservationState {}

final class DeleteReservationInitial extends DeleteDoctorReservationState {}

final class DeleteReservationLoading extends DeleteDoctorReservationState {}

final class DeleteReservationSuccess extends DeleteDoctorReservationState {
  final String successMessage;

  DeleteReservationSuccess({required this.successMessage});
}

final class DeleteReservationFailure extends DeleteDoctorReservationState {
  final String errMessage;

  DeleteReservationFailure({required this.errMessage});
}
