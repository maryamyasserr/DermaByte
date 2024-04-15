part of 'free_times_cubit.dart';

@immutable
sealed class FreeTimesState {}

final class FreeTimesInitial extends FreeTimesState {}

final class FreeTimesLoading extends FreeTimesState {}

final class FreeTimesSuccess extends FreeTimesState {

}

final class FreeTimesFailure extends FreeTimesState {
  final String errMessage;

  FreeTimesFailure({required this.errMessage});
}