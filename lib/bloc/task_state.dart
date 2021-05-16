part of 'task_bloc.dart';


class TaskState {
  List<TaskModel> tasks = [];
  TaskCurrentState currentState = TaskLoading();
  TaskState({this.tasks,this.currentState});

  TaskState copyWith({List<TaskModel> tasks,TaskCurrentState currentState}) {
    return TaskState(tasks:tasks, currentState:currentState);
  }
}



abstract class TaskCurrentState{}

class TaskLoading extends TaskCurrentState {

}

class TaskLoaded extends TaskCurrentState {}
