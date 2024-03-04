part of 'edoctor_cubit.dart';

@immutable
sealed class EdoctorState {}

final class EdoctorInitial extends EdoctorState {}

final class EdoctorLoading extends EdoctorState {}

final class EdoctorFailure extends EdoctorState {
  final String errMessage;
  EdoctorFailure({required this.errMessage});
}

final class EdoctorSuccess extends EdoctorState {
  final List<DoctorModel> doctors;
  EdoctorSuccess({required this.doctors});
}
