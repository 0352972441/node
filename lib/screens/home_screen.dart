import 'package:flutter/material.dart';
import 'package:note/common/widgets/statefulWidgets/task.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = false;
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(centerTitle: true,title:Text("Note"),backgroundColor:Colors.teal,actions: [
           IconButton(icon: Icon(Icons.list), onPressed: ()=>{})
         ],),
         body:SafeArea(
           child: Task(isGrid: isGrid,)
         )
       ),
    );
  }
}