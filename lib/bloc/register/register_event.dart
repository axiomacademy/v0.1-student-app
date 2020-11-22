part of 'register_bloc.dart';

/// Abstract class to wrap around all register events
abstract class RegisterEvent extends Equatable {
  /// Default constructor
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

/// Event where the register form is submitted
class RegisterSubmitted extends RegisterEvent {
  /// Takes in the required student parameters
  final String username, firstName, lastName, email, password;

  /// Default constructor
  const RegisterSubmitted(
      this.username, this.firstName, this.lastName, this.email, this.password);

  @override
  List<Object> get props => [username, firstName, lastName, email, password];
}
