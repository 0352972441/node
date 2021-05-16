part of 'logout_bloc.dart';

@immutable
abstract class LogoutEvent {}

class Logout extends LogoutEvent{
  User user;
  Logout(this.user);
}

class Login extends LogoutEvent{
  User user;
  Login(this.user);
}