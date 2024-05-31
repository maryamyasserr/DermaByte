part of 'get_my_freetimes_cubit.dart';

@immutable
sealed class GetMyFreeTimesDState {}

final class GetMyFreeTimesInitial extends GetMyFreeTimesDState {}

final class GetMyFreeTiemsLoading extends GetMyFreeTimesDState {}

final class GetMyFreeTimesSuccess extends GetMyFreeTimesDState {
  final List<MyFreeTimeModel> freeTimes;
  GetMyFreeTimesSuccess(this.freeTimes);
}

final class GetMyFreeTimesFailure extends GetMyFreeTimesDState {}
