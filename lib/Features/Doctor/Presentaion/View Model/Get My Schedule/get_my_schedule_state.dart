part of 'get_my_schedule_cubit.dart';

@immutable
sealed class GetMyScheduleState {}

final class GetMyScheduleInitial extends GetMyScheduleState {}

final class GetMyScheduleLoading extends GetMyScheduleState {}

final class GetMyScheduleSuccess extends GetMyScheduleState {
  final List<MyFreeTimeModel> freeTimes;
  GetMyScheduleSuccess(this.freeTimes);
}

final class GetMyScheduleFailure extends GetMyScheduleState {}
