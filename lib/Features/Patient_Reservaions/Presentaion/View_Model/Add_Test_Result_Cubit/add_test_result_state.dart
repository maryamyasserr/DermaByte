part of 'add_test_result_cubit.dart';

@immutable
sealed class AddTestResultState {}

final class AddTestResultInitial extends AddTestResultState {}

final class AddTestResultLoading extends AddTestResultState {}

final class AddTestResultSuccess extends AddTestResultState {}

final class DoneState extends AddTestResultState {}

final class AddTestResultFailure extends AddTestResultState {
  final String errMessage;

  AddTestResultFailure({required this.errMessage});
}

final class SelecttestSuccess extends AddTestResultState {
  final List<List<String>> tests;

  SelecttestSuccess({required this.tests});
}

final class SelecttestFailuar extends AddTestResultState {}
