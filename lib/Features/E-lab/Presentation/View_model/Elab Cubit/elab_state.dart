part of 'elab_cubit.dart';

@immutable
sealed class LabState {}

final class LabInitial extends LabState {}

final class LabLoading extends LabState {}

final class LabSuccess extends LabState {
  final List<LabModel> labs;
  LabSuccess({required this.labs});
}

final class LabFailure extends LabState {
  final String errMessage;
  LabFailure({required this.errMessage});
}
