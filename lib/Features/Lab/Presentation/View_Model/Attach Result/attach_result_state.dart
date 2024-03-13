part of 'attach_result_cubit.dart';

@immutable
sealed class AttachResultState {}

final class AttachResultInitial extends AttachResultState {}

final class AttachResultLoading extends AttachResultState {}

final class AttachResultSuccess extends AttachResultState {}

final class AttachResultFailure extends AttachResultState {
  final String errMessage;

  AttachResultFailure({required this.errMessage});
}
