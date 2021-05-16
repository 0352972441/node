

import 'package:flutter/material.dart';
import 'package:note/common/widgets/statefulWidgets/login.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
        appBar: AppBar(centerTitle: true,title:Text("Note"),backgroundColor:Colors.teal),
        body: Center(
          child: SafeArea(
            child: Login(),
          ),
        ),
    );
  }
}