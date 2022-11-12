abstract class Failure implements Exception {
  String get message;
}

class InvalidCredentialFailure implements Failure {
  @override
  final String message;

  InvalidCredentialFailure({required this.message});
}

 class UserNotFoundFailure implements Failure {
  @override
  final String message;

  UserNotFoundFailure(this.message);
}

class InternetFailure implements Failure {
  @override
  final String message;

  InternetFailure(this.message);
}
