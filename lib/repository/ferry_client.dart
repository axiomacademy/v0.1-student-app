import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

/// FerryClient encapsulates to expose a two ferry client instances,
/// one with and without auth
class FerryClient {
  final String _endpointUrl;
  Client _client;
  Client _authClient;

  /// Constructor to build the simple unauth client
  FerryClient(String url) : _endpointUrl = url {
    _client = Client(link: HttpLink(_endpointUrl));
  }

  /// Initialize the authenticated gql client
  Client initializeAuth(String token) {
    var link =
        HttpLink(_endpointUrl, defaultHeaders: {'Cookie': 'token=$token'});
    _authClient = Client(link: link);

    return _authClient;
  }

  /// Reset the auth client in case of logout
  void resetAuth() {
    _authClient = null;
  }

  /// Get the unauthenticated client
  Client getUnauthClient() => _client;

  /// Get the authenticated gql client
  Client getAuthClient() => _authClient;
}
