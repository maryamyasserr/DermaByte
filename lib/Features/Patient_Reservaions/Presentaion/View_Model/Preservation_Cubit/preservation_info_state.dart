part of 'preservation_info_cubit.dart';

sealed class PreservationInfoState {}

final class PreservationInfoInitial extends PreservationInfoState {}

final class PreservationInfoLoading extends PreservationInfoState {}

final class UpdateSLoading extends PreservationInfoState {}

final class PreservationInfoSuccess extends PreservationInfoState {
  final AllReservationModel allReservationModel;

  PreservationInfoSuccess({required this.allReservationModel});
}

final class PreservationInfoFailure extends PreservationInfoState {
  final String errMessage;
  PreservationInfoFailure({required this.errMessage});
}

final class PreservationInfoEmpty extends PreservationInfoState {}
