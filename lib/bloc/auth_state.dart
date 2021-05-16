part of 'auth_bloc.dart';


// @immutable
// abstract class AuthState {}

// class AuthInit extends AuthState {

// }


// class WeatherToday extends WeatherState {
//     Weather weather;
//     WeatherToday(this.weather);
// }

class AuthState{
  String email;
  bool get isValidUsername => email.contains("@");

  String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  AuthState({
    this.email = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  AuthState copyWith({
    String email,
    String password,
    FormSubmissionStatus formStatus,
  }) {
    return AuthState(
      email: email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

// class EmailChange extends AuthState{
//   String email;
//   EmailChange(this.email):super(email: email);
// }


abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {
}

class SubmissionSuccess extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  final Exception exception;

  SubmissionFailed(this.exception);
}