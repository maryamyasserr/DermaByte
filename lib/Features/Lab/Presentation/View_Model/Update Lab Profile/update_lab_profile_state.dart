part of 'update_lab_profile_cubit.dart';

@immutable
sealed class UpdateLabProfileState {}

final class UpdateLabProfileInitial extends UpdateLabProfileState {}

final class UpdateLabProfileLoading extends UpdateLabProfileState {}

final class UpdateLabProfileSuccess extends UpdateLabProfileState {}

final class UpdateLabProfileFailure extends UpdateLabProfileState {
  final String errMessage;

  UpdateLabProfileFailure({required this.errMessage});
}
