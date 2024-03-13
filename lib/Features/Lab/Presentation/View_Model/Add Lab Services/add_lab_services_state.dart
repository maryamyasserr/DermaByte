part of 'add_lab_services_cubit.dart';

@immutable
sealed class AddServiceState {}

final class AddServiceInitial extends AddServiceState {}

final class AddServiceLoading extends AddServiceState {}

final class AddServiceSuccess extends AddServiceState {}

final class AddServiceFailure extends AddServiceState {
  final String errMessage;

  AddServiceFailure({required this.errMessage});
}
