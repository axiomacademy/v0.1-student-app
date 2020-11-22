import 'dart:async';
import 'package:meta/meta.dart';
import 'package:ferry/ferry.dart';

import '../exceptions.dart';
import '../ferry_client.dart';
import 'gql/auth_requests.req.gql.dart';

/// Contains all the possible auth status
enum AuthStatus {
  /// Authentication state not known yet
  unknown,

  /// User has been authenticated
  authenticated,

  /// User is not authenticated
  unauthenticated
}

/// Contains all the GraphQL calls relating to authentication
class AuthRepository {
  final _controller = StreamController<AuthStatus>();
  final FerryClient _fclient;

  /// Constructor which accepts an unauthorised httpLink instance
  AuthRepository(FerryClient client) : _fclient = client;

  /// Publishes a stream which can be used to get the authentication status
  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  /// Calls LoginStudent graphql endpoint (also sets up token refresh)
  void logIn({
    @required String username,
    @required String password,
  }) async {
    final loginStudentReq = GLoginStudentReq(
      (b) => b
        ..fetchPolicy = FetchPolicy.NoCache
        ..vars.input.username = username
        ..vars.input.password = password,
    );

    final unauthClient = _fclient.getUnauthClient();
    await for (final res in unauthClient.request(loginStudentReq)) {
      if (res.hasErrors) {
        _fclient.resetAuth();
        _controller.add(AuthStatus.unauthenticated);
        throw GQLServerException(res.graphqlErrors.single.message);
      } else {
        final jwt = res.data?.loginStudent;

        if (jwt == null) {
          throw EmptyResponseException();
        }

        _fclient.initializeAuth(jwt);
        _controller.add(AuthStatus.authenticated);
        return;
      }
    }
  }

  /// Deletes local JWT string
  void logOut() {
    _fclient.resetAuth();
    _controller.add(AuthStatus.unauthenticated);
  }

  /// SHortcut to login with an existing jwt
  void logInManual(String jwt) {
    _fclient.initializeAuth(jwt);
    _controller.add(AuthStatus.authenticated);
  }

  /// Automatically disposes StreamController
  void dispose() => _controller.close();
}
