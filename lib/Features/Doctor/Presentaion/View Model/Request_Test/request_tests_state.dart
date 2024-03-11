part of 'request_tests_cubit.dart';

@immutable
sealed class RequestTestsState {}

final class RequestTestsInitial extends RequestTestsState {}

final class RequestTestsLoading extends RequestTestsState {}

final class RequestTestsSuccess extends RequestTestsState {}

final class RequestTestsFailure extends RequestTestsState {
  final String errMessage;

  RequestTestsFailure({required this.errMessage});
}
