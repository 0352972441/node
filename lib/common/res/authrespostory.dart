

import 'package:note/common/api/auth/auth.dart';
import 'package:note/common/models/user.dart';

class AuthResponstory{
  Auth _auth;
  AuthResponstory(){
    _auth = new Auth();
  }

  Future<User> login({String email, String password}) async {
    try{
      final dataJson =  await _auth.getRawLogin(email:email, password:password);
      return User.fromMap(dataJson);
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<User> signup({User user}) async {
    final dataJson =  await _auth.getRawSignUp(user);
    return User.fromMap(dataJson);
  }

  Future<User> profile({User user}) async {
    final dataJson =  await _auth.getRawProfile(user);
    return User.fromMap(dataJson);
  }

  Future<bool> logout() async {
    bool state =  await _auth.logout();
    if(!state){
      return true;
    }
    return false;
  }

}