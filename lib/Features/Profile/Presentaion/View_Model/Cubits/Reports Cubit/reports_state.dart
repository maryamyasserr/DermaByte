part of 'reports_cubit.dart';

@immutable
sealed class ReportState {}

final class ReportInitial extends ReportState {}

final class ReportLoading extends ReportState {}

final class ReportSuccess extends ReportState {
  final List<ReportModel> reports;

  ReportSuccess({required this.reports});
}

final class ReportFailure extends ReportState {
  final String errMessage;

  ReportFailure({required this.errMessage});
}
