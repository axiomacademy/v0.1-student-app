part of 'auth_bloc.dart';

/// AuthEvent is the abstract class of acceptable auth bloc events
abstract class AuthEvent extends Equatable {
  /// Empty const constructor
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// Event when there is an auth status change
class AuthStatusChanged extends AuthEvent {
  /// Takes in a new status as a constructor
  const AuthStatusChanged(this.status);

  /// New auth status
  final AuthStatus status;

  @override
  List<Object> get props => [status];
}

/// Event when student attempts to sign out
class AuthLogoutRequested extends AuthEvent {}
