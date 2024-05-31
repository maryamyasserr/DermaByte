part of 'get_my_freetimes_cubit.dart';

@immutable
sealed class GetMyFreeTimesDState {}

final class GetMyScheduleInitial extends GetMyFreeTimesDState {}

final class GetMyScheduleLoading extends GetMyFreeTimesDState {}

final class GetMyScheduleSuccess extends GetMyFreeTimesDState {
  final List<MyFreeTimeModel> freeTimes;
  GetMyScheduleSuccess(this.freeTimes);
}

final class GetMyScheduleFailure extends GetMyFreeTimesDState {}
