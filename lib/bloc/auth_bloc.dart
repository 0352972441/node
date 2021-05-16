import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note/bloc/logout_bloc.dart';
import 'package:note/common/models/user.dart';
import 'package:note/common/res/authrespostory.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthResponstory authRepo;
  User user;
  final LogoutBloc logoutBloc;
  AuthBloc({this.logoutBloc}) : super(AuthState()){
    authRepo = new AuthResponstory();
    loadPass();
  }

  savePass(User user)async{
    final prefer = await SharedPreferences.getInstance();
      final userData = user.toJson();
      prefer.setString('userData', userData);
  }

  loadPass()async{
    final perfer = await SharedPreferences.getInstance();
    if (!perfer.containsKey('userData')) {
      return false;
    }
    final extraData =
        json.decode(perfer.getString("userData")) as Map<String, Object>;
      if(extraData != null){
        this.user = User.fromMapJson(extraData);    
        add(LoginSubmited());
      }
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event,) async* {
    if(event is LoginEmailChanged){
      yield state.copyWith(email: event.email);
    }else if(event is LoginPasswordChanged){
      yield state.copyWith(password: event.password);
    }else if(event is LoginSubmited){
      try {
        if(user != null){
          logoutBloc.add(Login(user));
        }else{
          yield state.copyWith(formStatus: FormSubmitting());
          user = await authRepo.login(email: state.email, password: state.password);
          logoutBloc.add(Login(user));
          if(user != null )savePass(user);
        }
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed());
      }
    }
  }
}
