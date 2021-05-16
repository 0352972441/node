import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/bloc/auth_bloc.dart';
import 'package:note/bloc/logout_bloc.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.teal,
      alignment: Alignment.center,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _emailField(),
              SizedBox(
                height: 10,
              ),
              _passwordField(),
              SizedBox(
                height: 20,
              ),
              _submitFiled()
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
            errorText: state.email.length == 0 ? null : state.isValidUsername ? null : "Email is'nt valid",
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              //hintText: "Email",
              labelText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ))),
          validator: (value) =>
              state.isValidUsername ? null : "Email is'nt valid",
          onChanged: (value) =>
              context.read<AuthBloc>().add(LoginEmailChanged(email:value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return TextFormField(
          decoration: InputDecoration(
              errorText: state.password.length == 0 ? null : state.isValidPassword ? null : "Password is'nt valid",
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              //hintText: "Password",
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )),
          validator: (value) => state.isValidPassword ? null : "Password is'nt valid",
          onChanged: (value) => context.read<AuthBloc>().add(LoginPasswordChanged(password: value)),
        );
      },
    );
  }

  Widget _submitFiled() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
         return state.formStatus is FormSubmitting ? CircularProgressIndicator(backgroundColor: Colors.red,) : ElevatedButton(
            onPressed: (){if (_formKey.currentState.validate()) {
                  context.read<AuthBloc>().add(LoginSubmited());
                }
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Login"),
            ));
      },
    );
  }
}
