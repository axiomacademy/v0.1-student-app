part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState._({
    this.status = AuthStatus.unknown,
    this.user,
  });

  /// Unknown State
  const AuthState.unknown() : this._();

  /// Authenticated State
  const AuthState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  /// Unauthenticated State
  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  final AuthStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
