import 'dart:async';
import 'package:ferry/ferry.dart';

import '../ferry_client.dart';
import '../auth/auth_repository.dart';
import '../../models/student.dart';
import '../exceptions.dart';
import 'gql/student_requests.req.gql.dart';

/// Repository containing all the GQL queries/mutations for the Student
class StudentRepository {
  final FerryClient _fclient;
  final AuthRepository _authRepository;

  /// Constructor accepting a ferry client instance
  StudentRepository(FerryClient client, AuthRepository authRepository)
      : _fclient = client,
        _authRepository = authRepository;

  /// Creates/Registers a new stuedent, returns jwt
  Future<void> createStudent(String username, String firstName, String lastName,
      String email, String password,
      {String profilePic}) async {
    final createStudentReq = GCreateStudentReq((b) => b
      ..vars.input.username = username
      ..vars.input.firstName = firstName
      ..vars.input.lastName = lastName
      ..vars.input.email = email
      ..vars.input.password = password
      ..vars.input.profilePic = profilePic ?? "");

    final unauthClient = _fclient.getUnauthClient();

    await for (final res in unauthClient.request(createStudentReq)) {
      if (res.hasErrors) {
        throw GQLServerException(res.graphqlErrors.single.message);
      }

      final jwt = res.data?.createStudent;

      if (jwt == null) {
        throw EmptyResponseException();
      }

      _authRepository.logInManual(jwt);
    }
  }

  /// Gets the current logged in user
  Future<Student> getSelf() async {
    // Self query takes no parameters
    final selfReq =
        GSelfUserReq((b) => b..fetchPolicy = FetchPolicy.CacheAndNetwork);

    // Retreive auth client and create request (check if the auth client exists)
    final authClient = _fclient.getAuthClient();
    if (authClient == null) {
      throw ("Error retrieving self: Not authorised");
    }

    await for (final res in authClient.request(selfReq)) {
      if (res.hasErrors) {
        throw (res.graphqlErrors.single.message);
      }

      // Default to returning an empty map so that key lookups don't fail
      final rawStudent = res.data?.self?.toJson() ?? const {};

      return Student(
          rawStudent["id"],
          rawStudent["username"],
          rawStudent["firstName"],
          rawStudent["lastName"],
          rawStudent["email"],
          rawStudent["profilePic"]);
    }

    throw GraphQLStreamException();
  }
}
