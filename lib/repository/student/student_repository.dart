import 'dart:async';

import '../../models/student.dart';

/// Repository containing all the GQL queries/mutations for the Student
class StudentRepository {
  /// Gets the current logged in user
  Future<Student> getSelf() async {
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => Student("ha", "sudharshan", "shan", "pew", "292", "somewhere.com"),
    );
  }
}
