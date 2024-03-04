part of 'lab_request_cubit.dart';

@immutable
sealed class LabRequestState {}

final class LabRequestInitial extends LabRequestState {}

final class LabRequestLoading extends LabRequestState {}

final class LabRequestFailure extends LabRequestState {
  final String errMessage;
  LabRequestFailure({required this.errMessage});
}

final class LabRequestSuccess extends LabRequestState {
  final List<LabRequest> labRequests;
  LabRequestSuccess({required this.labRequests});
}
