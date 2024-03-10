part of 'my_patient_report_cubit.dart';

@immutable
sealed class MyPatientReportState {}

final class MyPatientReportInitial extends MyPatientReportState {}

final class MyPatientReportLoading extends MyPatientReportState {}

final class MyPatientReportSuccess extends MyPatientReportState {}

final class MyPatientReportFailure extends MyPatientReportState {
  final String errMessage;

  MyPatientReportFailure({required this.errMessage});
}
