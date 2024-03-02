part of 'consults_cubit.dart';

@immutable
sealed class ConsultsState {}

final class ConsultsInitial extends ConsultsState {}

final class ConsultsLoading extends ConsultsState {}

final class ConsultsSuccess extends ConsultsState {
  final List<PatientConsultsModel> consults;

  ConsultsSuccess({required this.consults});
}

final class ConsultsFailure extends ConsultsState {
  final String errMessage;

  ConsultsFailure({required this.errMessage});
}
