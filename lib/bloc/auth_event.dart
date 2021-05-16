part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {

}

class LoginEmailChanged extends AuthEvent{
  final String email;
  LoginEmailChanged({this.email});
}

class LoginPasswordChanged extends AuthEvent{
  String password;
  LoginPasswordChanged({this.password});
}

class LoginSubmited extends AuthEvent{
  // String email;
  // String password;
  LoginSubmited();
}