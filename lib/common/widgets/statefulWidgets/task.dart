import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/bloc/logout_bloc.dart';
import 'package:note/bloc/task_bloc.dart';
import 'package:note/common/models/task.dart';
import 'package:note/common/res/taskrespository.dart';

class Task extends StatefulWidget {
  bool isGrid;
  Task({Key key, this.isGrid}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  //List<TaskModel> tasks = [];
  TaskRespository _respon;
  @override
  void initState() {
    
    super.initState();
    _respon = new TaskRespository();
    getTask();
  }

  Future<void> getTask() async {
    //tasks = await _respon.tasks(token:context.read<LogoutBloc>().state.user.token);
    context
        .read<TaskBloc>()
        .add(Tasks(token: context.read<LogoutBloc>().state.user.token));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: widget.isGrid
            ? BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) =>  GridView.builder(
                  padding: EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      mainAxisExtent: 150,
                      childAspectRatio: 1 / 3,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemCount: state.tasks == null ? 0 : state.tasks.length,
                  itemBuilder: (context, index) {
                    if(state.currentState is TaskLoading){
                      return CircularProgressIndicator();
                    }else{
                      return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[100],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(state.tasks[index].description,textAlign: TextAlign.center),
                            ),
                      );
                    }
                  },
                ),
            )
            : Column(
                children: [
                  Expanded(
                    child: BlocBuilder<TaskBloc, TaskState>(
                      builder: (context, state) {
                        return ListView.builder(
                          itemCount:
                              state.tasks == null ? 0 : state.tasks.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),//Key(state.tasks[index].id),
                              background: Container(
                                alignment: Alignment.centerRight,
                                width: double.infinity,
                                height: 50,
                                padding: EdgeInsets.only(right: 50),
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color:Colors.red[100],
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(5)),
                                child: Icon(Icons.delete,color: Colors.red,),
                            ),
                            direction: DismissDirection.endToStart,
                            confirmDismiss: (direction){
                              return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Are you sure ?"),
                                  content: Text("Do you want remove task ?"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context, true);
                                        },
                                        child: Text("OK")),
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context, false);
                                        },
                                        child: Text("Cancel")),
                                  ],
                                );
                            },);},
                            onDismissed: (value)async{
                              bool isDelete = await _respon.delete(token:context.read<LogoutBloc>().state.user.token,id:state.tasks[index].id);
                              if(isDelete){
                                context.read<TaskBloc>().add(Tasks(token: context.read<LogoutBloc>().state.user.token));
                              }else{
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Delete faild"),
                                ));
                              }
                            },
                            child:  Container(
                                width: double.infinity,
                                height: 50,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(5)),
                                child: _taskWidget(state.tasks[index]),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                      height: 15,
                      child: Divider(
                        height: 1,
                        thickness: 2,
                      )),
                  Expanded(
                    child: BlocBuilder<TaskBloc, TaskState>(
                      builder: (context, state) {
                        return ListView.builder(
                          itemCount: state.tasks == null ? 0 : state.tasks.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              height: 50,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: _taskWidget(state.tasks[index]),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ));
  }

  Row _taskWidget(TaskModel task) {
    return Row(
      children: [
        Checkbox(value: task.isCompleted, onChanged: (value) async{
          context.read<TaskBloc>().add(Update(isCompleted: value,id: task.id));
          bool isUpdate = await _respon.update(token: context.read<LogoutBloc>().state.user.token,id:task.id,desc: task.description,isCompleted: value);
          if(isUpdate){
            context.read<TaskBloc>().add(Tasks(token: context.read<LogoutBloc>().state.user.token));
          }else{
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Cập nhật thất bại")));
          }
        }),
        Text(task.description ?? ""),
      ],
    );
  }
}
