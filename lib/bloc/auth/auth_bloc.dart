import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../models/student.dart';

import '../../repository/auth/auth_repository.dart';
import '../../repository/student/student_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// AUthBloc that manages authentication state
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  /// Stores the auth repository instance
  final AuthRepository _authRepository;

  /// Stores the student repository instance
  final StudentRepository _studentRepository;

  /// Stores the subscription from the auth status
  /// stream from the auth respository
  StreamSubscription<AuthStatus> _authStatusSubscription;

  /// Constructor for the AuthBloc
  AuthBloc(
      {@required AuthRepository authRepository,
      @required StudentRepository studentRepository})
      : _authRepository = authRepository,
        _studentRepository = studentRepository,
        super(const AuthState.unknown()) {
    _authStatusSubscription = _authRepository.status
        .listen((status) => add(AuthStatusChanged(status)));
  }

  Future<AuthState> _mapAuthStatusChangedToState(
      AuthStatusChanged event) async {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        return const AuthState.unauthenticated();
      case AuthStatus.authenticated:
        // Retrive the student
        final student = await _studentRepository.getSelf();
        return AuthState.authenticated(student);
      default:
        return const AuthState.unknown();
    }
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthStatusChanged) {
      // Catch any possible errors when calling the student repository
      yield await _mapAuthStatusChangedToState(event);
    } else if (event is AuthLogoutRequested) {
      _authRepository.logOut();
    }
  }

  @override
  Future<void> close() {
    _authStatusSubscription?.cancel();
    _authRepository.dispose();
    return super.close();
  }
}
