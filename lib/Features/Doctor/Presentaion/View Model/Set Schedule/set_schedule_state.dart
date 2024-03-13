part of 'set_schedule_cubit.dart';

@immutable
sealed class SetScheduleState {}

final class SetScheduleInitial extends SetScheduleState {}

final class SetScheduleLoading extends SetScheduleState {}

final class SetScheduleSuccess extends SetScheduleState {
  final String successMessage;

  SetScheduleSuccess({required this.successMessage});
}

final class SetScheduleFailure extends SetScheduleState {
  final String errMessage;

  SetScheduleFailure({required this.errMessage});
}
