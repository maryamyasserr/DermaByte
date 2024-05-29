part of 'preservation_info_cubit.dart';

@immutable
sealed class PreservationInfoState {}

final class PreservationInfoInitial extends PreservationInfoState {}

final class PreservationInfoLoading extends PreservationInfoState {}
final class UpdateSLoading extends PreservationInfoState {}

final class PreservationInfoSuccess extends PreservationInfoState {
  final List<PreservationModel> pReservationInfo;

  PreservationInfoSuccess({required this.pReservationInfo});
}

final class PreservationInfoFailure extends PreservationInfoState {
  final String errMessage;
  PreservationInfoFailure({required this.errMessage});
}

final class PreservationInfoEmpty extends PreservationInfoState {}
