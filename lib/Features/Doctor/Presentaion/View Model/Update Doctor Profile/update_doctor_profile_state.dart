part of 'update_doctor_profile_cubit.dart';

@immutable
sealed class UpdateDoctorProfileState {}

final class UpdateDoctorProfileInitial extends UpdateDoctorProfileState {}

final class UpdateDoctorProfileLoading extends UpdateDoctorProfileState {}

final class UpdateDoctorProfileSuccess extends UpdateDoctorProfileState {}
final class UpdateDoctorPasswordSuccess extends UpdateDoctorProfileState {}

final class UpdateDoctorProfileFailure extends UpdateDoctorProfileState {
  final String errMessage;

  UpdateDoctorProfileFailure({required this.errMessage});
}
