part of 'login_bloc.dart';

/// Abstract class to wrap around all events
abstract class LoginEvent extends Equatable {
  /// Default constructor
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// Event when the login form is submitted
class LoginSubmitted extends LoginEvent {
  /// Takes in the username and password
  final String username, password;

  /// Default constructor
  const LoginSubmitted(this.username, this.password);

  @override
  List<Object> get props => [username, password];
}
