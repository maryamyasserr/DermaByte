part of 'update_patient_profile_cubit.dart';

@immutable
sealed class UpdatePatientProfileState {}

final class UpdatePatientProfileInitial extends UpdatePatientProfileState {}

final class UpdatePatientProfileLoading extends UpdatePatientProfileState {}
final class UpdatePatinetPasswordSuccess extends UpdatePatientProfileState {}

final class UpdatePatientProfileFailure extends UpdatePatientProfileState {
  final String errMessage;

  UpdatePatientProfileFailure({required this.errMessage});
}

final class UpdatePatientProfileSuccess extends UpdatePatientProfileState {}
