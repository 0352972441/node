part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {
}

class Tasks extends TaskEvent {
  String token;
  Tasks({this.token});
}
class Delete extends TaskEvent {
  String token;
  String id;
  Delete({this.token, this.id});
}
class Update extends TaskEvent {
  // String token;
  String id;
  // String desc;
  bool isCompleted;
  Update({this.isCompleted,this.id});
  //Update({this.token, this.id, this.desc,this.isCompleted});
}
class Task extends TaskEvent {
  String token;
  String id;
  Task({this.token, this.id});
}
class CreateTask extends TaskEvent {
  String token;
  String desc;
  bool isCompleted;
  CreateTask({this.token, this.isCompleted, this.desc});
}