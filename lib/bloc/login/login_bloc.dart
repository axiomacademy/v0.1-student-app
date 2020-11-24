import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repository/auth/auth_repository.dart';
import '../../repository/exceptions.dart';

part 'login_event.dart';
part 'login_state.dart';

/// Main Login wrapping bloc
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  /// Default login bloc constructor
  LoginBloc(AuthRepository authRepository)
      : _authRepository = authRepository,
        super(const LoginState.unknown());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitted) {
      yield LoginState.submitting();
      try {
        await _authRepository.logIn(
            username: event.username, password: event.password);
        yield LoginState.successful();
      } on GQLServerException catch (e) {
        print(e.errorMessage);
        yield LoginState.failed(e.errorMessage);
      }
    }
  }
}
