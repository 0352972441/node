import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/bloc/logout_bloc.dart';
import 'package:note/bloc/task_bloc.dart';
import 'package:note/common/widgets/statefulWidgets/task.dart' as widget;
import 'package:note/cubit/view_mode_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   getTask();
  // }

  // void getTask()async{
  //   context.read<TaskBloc>().add(Tasks(token:context.read<LogoutBloc>().state.user.token));
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Note"),
            backgroundColor: Colors.teal,
            actions: [
              BlocBuilder<ViewModeCubit, ViewModeState>(
                builder: (context, state) => IconButton(
                    icon: Icon(state.isGrid ? Icons.list : Icons.grid_view),
                    onPressed: () =>
                        {context.read<ViewModeCubit>().changeViewMode()}),
              )
            ],
          ),
          body: SafeArea(child: BlocBuilder<ViewModeCubit, ViewModeState>(
            builder: (context, state) {
              return widget.Task(
                  isGrid: state.isGrid,
              );
            },
          )),
    ));
  }
}
