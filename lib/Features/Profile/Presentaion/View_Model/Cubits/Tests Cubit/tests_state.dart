part of 'tests_cubit.dart';

@immutable
sealed class TestsState {}

final class TestsInitial extends TestsState {}

final class TestsLoading extends TestsState {}

final class TestsSuccess extends TestsState {
  final List<TestModel> tests;

  TestsSuccess({required this.tests});
}

final class TestsFailure extends TestsState {
  final String errMessage;

  TestsFailure({required this.errMessage});
}
