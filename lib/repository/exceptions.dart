/// Standard server error Exeption from graphql endpongs
class GQLServerException implements Exception {
  /// The error message
  final String errorMessage;

  /// Default constructor
  GQLServerException(this.errorMessage);
}

/// Ferry stream error exception
class GraphQLStreamException implements Exception {}

/// Empty/null graphql response
class EmptyResponseException implements Exception {}

/// AuthenticationException
class UnauthenticatedException implements Exception {}
