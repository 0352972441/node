import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:note/bloc/logout_bloc.dart';
import 'package:note/common/res/authrespostory.dart';
import 'package:note/screens/auth_screen.dart';
import 'package:note/screens/home_screen.dart';

import 'bloc/auth_bloc.dart';

Future main() async {
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthResponstory(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>LogoutBloc()),
          BlocProvider(create: (context)=> AuthBloc(logoutBloc: BlocProvider.of(context))),
        ],
        child: MaterialApp(
            showSemanticsDebugger: false,
            title: "Note",
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.light(),
            theme: ThemeData(primarySwatch: Colors.teal),
            home: BlocBuilder<LogoutBloc, LogoutState>(builder: (context, state){
              return state.user != null ? HomeScreen():AuthScreen();
            },)
            ),
      ),
    );
  }
}
