import 'package:dartz/dartz.dart';
import 'package:firebase_login/app/modules/login/domain/models/login_credential.dart';
import 'package:firebase_login/app/modules/login/domain/models/user_model.dart';
import 'package:firebase_login/app/modules/login/domain/repository/login_repository.dart';
import 'package:firebase_login/app/modules/login/domain/services/internet_connection_service.dart';

import '../errors/errors.dart';

abstract class LoginWithGoogleAccount {
  Future<Either<Failure, UserModel?>> call(LoginCredential credential);
}

class LoginWithGoogleAccountImpl implements LoginWithGoogleAccount {
  final LoginRepository repo;
  final InternetConnectionService connection;

  LoginWithGoogleAccountImpl({required this.repo, required this.connection});
  @override
  Future<Either<Failure, UserModel?>> call(LoginCredential credential) async {
    var checkConn = await connection.isConnected();
    if (credential.isVallidGoogleAccount) {
      if (checkConn.isRight()) {
        return await repo.loginWithGoogleAccount(
            googleAccount: credential.userEmail);
      } else {
        return left(InternetFailure('Sem conexao a internet'));
      }
    } else {
      return left(
          InvalidCredentialFailure(message: 'As credenciais não são válidas'));
    }
  }
}
