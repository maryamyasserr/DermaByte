part of 'free_times_cubit.dart';

@immutable
sealed class FreeTimesState {}

final class FreeTimesInitial extends FreeTimesState {}

final class FreeTimesLoading extends FreeTimesState {}

final class FreeTimesEmpty extends FreeTimesState {}

final class FreeTimesSuccess extends FreeTimesState {
  final FreeTimeModel? freeTime;

  FreeTimesSuccess({this.freeTime});
}

final class SelectedFreeTime extends FreeTimesState {
  final FreeTimeModel freeTime;

  SelectedFreeTime({required this.freeTime});
}

final class FreeTimesFailure extends FreeTimesState {
  final String errMessage;

  FreeTimesFailure({required this.errMessage});
}
