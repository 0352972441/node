import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note/common/models/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<List<TaskModel>> {
  TaskCubit() : super(null);

  void selectedTask(){
    
  }
}
