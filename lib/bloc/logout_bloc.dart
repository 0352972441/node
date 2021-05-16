import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note/common/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutState());

  @override
  Stream<LogoutState> mapEventToState(LogoutEvent event,) async* {
    if(event is Logout){
      final perfec = await SharedPreferences.getInstance();
      perfec.clear();
      yield state.copyWith(user: null,authState: Logouted());
    }else if(event is Login){
      yield state.copyWith(user: event.user,authState:Logined());
    }
  }
}
