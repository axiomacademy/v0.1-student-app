import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repository/exceptions.dart';
import '../../repository/student/student_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

/// Main register wrapping bloc
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final StudentRepository _studentRepository;

  /// Default register bloc constructor
  RegisterBloc(StudentRepository studentRepository)
      : _studentRepository = studentRepository,
        super(const RegisterState.unknown());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterSubmitted) {
      yield RegisterState.submitting();
      try {
        await _studentRepository.createStudent(event.username, event.firstName,
            event.lastName, event.email, event.password);
        yield RegisterState.successful();
      } on GQLServerException catch (e) {
        print(e.errorMessage);
        yield RegisterState.failed(e.errorMessage);
      }
    }
  }
}
