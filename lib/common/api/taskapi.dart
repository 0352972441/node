import 'dart:convert';
import 'dart:io';
import '../models/task.dart' as taskModel;
import 'package:http/http.dart' as http;

class TaskAPI {
  Future<Map<String,Object>> getTask({String id, String token}) async{
      Uri url = Uri.parse("https://toan-task-app.herokuapp.com/task/${id}");
      final response = await http.get(url,headers: {HttpHeaders.connectionHeader: "application/json",HttpHeaders.authorizationHeader: "Bearer ${token}"});
      print(response.body);
      if(response.statusCode == 200){
        return json.decode(response.body);
      }else{
        throw Exception('Read faild');
      }
  }

  Future<List<dynamic>> getTasks(String token) async{
      Uri url = Uri.parse("https://toan-task-app.herokuapp.com/tasks");
      final response = await http.get(url,headers: {HttpHeaders.connectionHeader: "application/json",HttpHeaders.authorizationHeader: "Bearer ${token}"});
      //print(response.body);
      if(response.statusCode == 200){
        // final a = (json.decode(response.body) as List).map((e) => taskModel.Task.fromMap(e)).toList();
        // print("JSON: ${a}");
        return json.decode(response.body);
      }else{
        throw Exception('Read list faild');
      }
  }

  Future<bool> createTasks({String token, String desc, bool isCompleted = false}) async{
      Uri url = Uri.parse("https://toan-task-app.herokuapp.com/task");
      final response = await http.post(url,body: json.encode({
        "description":desc,
        "isCompleted":isCompleted
      }),headers: {HttpHeaders.connectionHeader: "application/json",HttpHeaders.authorizationHeader: "Bearer ${token}"});
      print(response.body);
      if(response.statusCode == 201){
        return true;
      }else{
        throw Exception('Create faild');
      }
  }

  Future<bool> updateTask({String token, String id,String desc,bool isCompleted}) async{
    print(isCompleted);
    print(id);
      Uri url = Uri.parse("https://toan-task-app.herokuapp.com/tasks/${id}");
      final response = await http.put(url,body: json.encode({
          "description":desc,
          "completed":isCompleted
      }),headers: {HttpHeaders.connectionHeader: "application/json",HttpHeaders.authorizationHeader: "Bearer ${token}"});
      print(response.body);
      if(response.statusCode == 200){
        return true;
      }else{
        throw Exception('Create faild');
      }
  }

  Future<bool> deleteTask({String token, String id}) async{
      Uri url = Uri.parse("https://toan-task-app.herokuapp.com/tasks/${id}");
      final response = await http.delete(url,headers: {HttpHeaders.connectionHeader: "application/json",HttpHeaders.authorizationHeader: "Bearer ${token}"});
      print(response.body);
      //return true;
      if(response.statusCode == 200){
        return true;
      }else{
        throw Exception('delete faild');
      }
  }

}