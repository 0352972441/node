import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note/common/res/authrespostory.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthResponstory authRepo;
  AuthBloc() : super(AuthState()){
    authRepo = new AuthResponstory();
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event,) async* {
    if(event is LoginEmailChanged){
      yield state.copyWith(email: event.email);
    }else if(event is LoginPasswordChanged){
      yield state.copyWith(password: event.password);
    }else if(event is LoginSubmited){
      yield state.copyWith(formStatus: FormSubmitting());
      try {
        await authRepo.login(email: state.email, password: state.password);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
