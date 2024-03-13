part of 'update_report_cubit.dart';

@immutable
sealed class UpdateReportState {}

final class UpdatePatientReportInitial extends UpdateReportState {}

final class UpdatePatientReportStateLoading extends UpdateReportState {}

final class UpdatePatientReportStateSuccess extends UpdateReportState {}

final class UpdatePatientReportStateFailure extends UpdateReportState {
  final String errMessage;

  UpdatePatientReportStateFailure({required this.errMessage});
}
