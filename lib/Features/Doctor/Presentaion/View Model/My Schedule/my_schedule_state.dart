part of 'my_schedule_cubit.dart';

@immutable
sealed class MyScheduleState {}

final class MyScheduleInitial extends MyScheduleState {}
final class MyScheduleLoading extends MyScheduleState {}
final class MyScheduleSuccess extends MyScheduleState {}
final class MyScheduleFailure extends MyScheduleState {}
