import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note/common/models/task.dart';
import 'package:note/common/res/taskrespository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskRespository _respon;
  TaskBloc() : super(TaskState()){
    _respon = new TaskRespository();
  }

  @override
  Stream<TaskState> mapEventToState(TaskEvent event,) async* {
    if(event is Tasks){
      List<TaskModel> tasks = await _respon.tasks(token:event.token);
      yield state.copyWith(tasks:tasks, currentState:TaskLoaded());
    }else if(event is Task){
      List<TaskModel> taskList = [];
      final task = await _respon.task(token:event.token,id:event.id);
      taskList.add(task);
      yield state.copyWith(tasks:taskList, currentState:TaskLoaded());
    }else if(event is Update){
      List<TaskModel> taskList = [...state.tasks];
      final task = taskList.firstWhere((element) => element.id == event.id);
      task.isCompleted = event.isCompleted;
      //await _respon.update(isCompleted: event.isCompleted,event.id);
      yield state.copyWith(tasks:taskList, currentState:TaskLoaded());
    }
  }
}
