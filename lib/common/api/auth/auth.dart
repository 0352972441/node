import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:note/common/models/user.dart';

class Auth {
//   final Map<String, String> headers = {
//   HttpHeaders.contentTypeHeader: "application/json", // or whatever
//   HttpHeaders.authorizationHeader: "Bearer $token",
// };

  Future<Map<String,Object>> getRawLogin({String email,String password}) async{
      Uri url = Uri.parse("https://toan-task-app.herokuapp.com/users/login");
      final response = await http.post(url,body:json.encode(
        {
          "email": email,
          "password": password
        }
      ),headers: {"Content-type": "application/json"});
      if(response.statusCode == 200){
        return json.decode(response.body);
      }else{
        throw Exception('Login is faild');
      }
  }

  Future<Map<String,Object>> getRawSignUp(User user) async{
      Uri url = Uri.parse("https://toan-task-app.herokuapp.com/user");
      final response = await http.post(url,body:json.encode(
        user.toMap()
      ),headers: {"Content-type": "application/json"});
      if(response.statusCode == 200){
        return json.decode(response.body);
      }else{
        throw Exception('signup is faild');
      }
  }

  Future<Map<String,Object>> getRawProfile(User user) async{
      Uri url = Uri.parse("https://toan-task-app.herokuapp.com/users/me");
      final response = await http.get(url,headers: {HttpHeaders.connectionHeader: "application/json",HttpHeaders.authorizationHeader: "Bearer ${user.token}"});
      if(response.statusCode == 200){
        return json.decode(response.body);
      }else{
        throw Exception('Login is faild');
      }
  }

  Future<bool> logout() async{
      Uri url = Uri.parse("https://toan-task-app.herokuapp.com/users/logout");
      final response = await http.post(url,headers: {"Content-Type": "application/json"});
      if(response.statusCode == 200){
        return false;
      }else{
        return true;
        //throw Exception('Logout is faild');
      }
  }

}