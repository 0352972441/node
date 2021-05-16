

import 'dart:convert';

import 'package:note/common/api/taskapi.dart';
import 'package:note/common/models/task.dart';

class TaskRespository{
  TaskAPI _task;
  TaskRespository(){
    _task = new TaskAPI();
  }

  Future<TaskModel> task({String id,String token}) async {
    try{
      final dataMap =  await _task.getTask(id: id,token: token);
      return TaskModel.fromMap(dataMap);
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<List<TaskModel>> tasks({String token}) async {
    final dataJson =  await _task.getTasks(token);
    //List<Task> tasks = [];
    //dataJson.map((e) => print(e)).toList();
    final tasks = dataJson.map((e) => TaskModel.fromMap(e)).toList();
    return tasks;
  }

  Future<bool> delete({String token,String id}) async {
    final dataJson =  await _task.deleteTask(token: token,id:id);
    if(dataJson){
      return true;
    }
    return false;
  }

  Future<bool> update({String token, String id, String desc, bool isCompleted}) async {
    bool state =  await _task.updateTask(id: id, desc: desc, isCompleted: isCompleted, token: token);
    if(state){
      return true;
    }
    return false;
  }
}