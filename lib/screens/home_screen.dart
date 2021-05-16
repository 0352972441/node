import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(centerTitle: true,title:Text("Note"),backgroundColor:Colors.teal),
         body:SafeArea(
           child:Center(
             child: Text("Note"),
           )
         )
       ),
    );
  }
}