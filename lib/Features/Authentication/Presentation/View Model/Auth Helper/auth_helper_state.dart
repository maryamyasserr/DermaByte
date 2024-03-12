part of 'auth_helper.dart';

@immutable
sealed class AuthHeplerState {}

final class AuthHelperInitial extends AuthHeplerState {}

final class AuthHelperSuccess extends AuthHeplerState {}
