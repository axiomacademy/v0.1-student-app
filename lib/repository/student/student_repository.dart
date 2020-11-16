import 'dart:async';
import 'package:ferry/ferry.dart';

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

      print(res.data?.self);
      return Student(
          "1", "Sudharshan", "SHan", "Sundar", "sudhar393", "picture");
    }

    throw ("Error retrieving self: Stream returned nothing");
  }
}
