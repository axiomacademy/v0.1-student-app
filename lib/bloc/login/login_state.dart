part of 'login_bloc.dart';

/// Status of the login attempt
enum LoginStatus {
  /// Login attempt hasn't been run
  unknown,

  /// Login attempt was successfull
  successful,

  /// Login attempt currently running
  submitting,

  /// Login attempt failed
  failed
}

/// Login bloc status
class LoginState extends Equatable {
  /// Enum storing the status
  final LoginStatus status;

  /// Any messages usually for failed status
  final String message;

  const LoginState._({this.status = LoginStatus.unknown, this.message});

  /// Unknown state
  const LoginState.unknown() : this._();

  /// Successful login state
  const LoginState.successful() : this._(status: LoginStatus.successful);

  /// Running login state
  const LoginState.submitting() : this._(status: LoginStatus.submitting);

  /// Failed state
  const LoginState.failed(String error)
      : this._(status: LoginStatus.failed, message: error);

  @override
  List<Object> get props => [status];
}
