part of 'get_lab_services_cubit.dart';

@immutable
sealed class GetLabServicesState {}

final class GetLabServicesInitial extends GetLabServicesState {}

final class GetLabServicesLoadign extends GetLabServicesState {}

final class GetLabServicesSuccess extends GetLabServicesState {
  final List<ServiceModel> services;

  GetLabServicesSuccess({required this.services});
}

final class GetLabServicesFailure extends GetLabServicesState {
  final String errMessage;

  GetLabServicesFailure({required this.errMessage});
}
