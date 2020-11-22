part of 'register_bloc.dart';

/// Status of the register attempt
enum RegisterStatus {
  /// Register attempt hasn't been run
  unknown,

  /// Register attempt was successfull
  successful,

  /// Register attempt currently running
  submitting,

  /// Register attempt failed
  failed
}

/// Login bloc status
class RegisterState extends Equatable {
  /// Enum storing the status
  final RegisterStatus status;

  /// Any messages usually for failed status
  final String message;

  const RegisterState._({this.status = RegisterStatus.unknown, this.message});

  /// Unknown state
  const RegisterState.unknown() : this._();

  /// Successful register state
  const RegisterState.successful() : this._(status: RegisterStatus.successful);

  /// Running register state
  const RegisterState.submitting() : this._(status: RegisterStatus.submitting);

  /// Failed state
  const RegisterState.failed(String error)
      : this._(status: RegisterStatus.failed, message: error);

  @override
  List<Object> get props => [status];
}

//
