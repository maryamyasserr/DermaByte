part of 'lab_reservaion_cubit.dart';

@immutable
sealed class LabReservaionState {}

final class LabReservaionInitial extends LabReservaionState {}

final class LabReservaionLoading extends LabReservaionState {
  LabReservaionLoading();
}

final class LabReservaionFailuer extends LabReservaionState {
  final String errMessage;

  LabReservaionFailuer({required this.errMessage});
}

final class LabReservaionSuccess extends LabReservaionState {
  final String successMessage;

  LabReservaionSuccess({required this.successMessage});
}
