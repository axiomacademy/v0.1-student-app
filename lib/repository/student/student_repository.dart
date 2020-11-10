import 'dart:async';

import "gql/student_queries.req.gql.dart";
import '../../models/student.dart';
import '../ferry_client.dart';

/// Repository containing all the GQL queries/mutations for the Student
class StudentRepository {
  final FerryClient _fclient;

  /// Constructor accepting a ferry client instance
  StudentRepository(FerryClient client) : _fclient = client;

  /// Gets the current logged in user
  Future<Student> getSelf() async {
    final selfReq = GSelfUserReq((b) => b);

    final response = await _fclient.getAuthClient().request(selfReq).single;
    if (response.hasErrors) {
      throw ('Unable to fetch self student');
    }

    return Future.delayed(
      const Duration(milliseconds: 300),
      () => Student("ha", "sudharshan", "shan", "pew", "292", "somewhere.com"),
    );
  }
}
