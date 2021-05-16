part of 'logout_bloc.dart';

class LogoutState {
  User user;
  AuthCurrentState authState;
  LogoutState({this.user, this.authState});

  

  LogoutState copyWith({User user,AuthCurrentState authState,}) {
    return LogoutState(user:user, authState:authState);
  }
}


abstract class AuthCurrentState{

}

class Logouted extends AuthCurrentState {}
class Logined extends AuthCurrentState{}