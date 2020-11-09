import 'dart:async';
import 'package:meta/meta.dart';

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

  /// Publishes a stream which can be used to get the authentication status
  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  /// Calls LoginStudent graphql endpoint (also sets up token refresh)
  Future<void> logIn({
    @required String username,
    @required String password,
  }) async {
    assert(username != null);
    assert(password != null);

    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthStatus.authenticated),
    );
  }

  /// Deletes local JWT string
  void logOut() {
    _controller.add(AuthStatus.unauthenticated);
  }

  /// Automatically disposes StreamController
  void dispose() => _controller.close();
}
