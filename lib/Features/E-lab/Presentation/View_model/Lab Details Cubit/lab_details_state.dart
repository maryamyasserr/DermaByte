part of 'lab_details_cubit.dart';

@immutable
sealed class LabDetailsState {}

final class LabDetailsInitial extends LabDetailsState {}

final class LabDetailsLoading extends LabDetailsState {}

final class LabDetailsFailure extends LabDetailsState {
  final String errMessage;
  LabDetailsFailure({required this.errMessage});
}

final class LabDetailsSuccess extends LabDetailsState {
  final LabModel labDetails;
  LabDetailsSuccess({required this.labDetails});
}
