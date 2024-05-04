part of 'lab_helper_cubit.dart';

@immutable
sealed class LabHelperState {}

final class LabHelperInitial extends LabHelperState {}

final class LabHelperSuccess extends LabHelperState {}
final class LabHelperLoading extends LabHelperState {}

final class LabHelperFailure extends LabHelperState {}
