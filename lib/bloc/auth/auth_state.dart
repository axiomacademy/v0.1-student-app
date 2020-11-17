part of 'auth_bloc.dart';

/// AuthState represents the internal bloc state
class AuthState extends Equatable {
  /// Contains the authentication status
  final AuthStatus status;

  /// Contains the instance of the currently logged in student
  final Student student;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.student,
  });

  /// Unknown State
  const AuthState.unknown() : this._();

  /// Authenticated State
  const AuthState.authenticated(Student student)
      : this._(status: AuthStatus.authenticated, student: student);

  /// Unauthenticated State
  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  @override
  List<Object> get props => [status, student];
}
