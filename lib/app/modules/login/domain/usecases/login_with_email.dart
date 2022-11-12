import 'package:dartz/dartz.dart';
import 'package:firebase_login/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login/app/modules/login/domain/models/login_credential.dart';
import 'package:firebase_login/app/modules/login/domain/models/user_model.dart';
import 'package:firebase_login/app/modules/login/domain/repository/login_repository.dart';
import 'package:firebase_login/app/modules/login/domain/services/internet_connection_service.dart';

abstract class LoginWithEmail {
  Future<Either<Failure, UserModel?>> call(
      {required LoginCredential credential});
}

class LoginWithEmailImpl implements LoginWithEmail {
  final LoginRepository repository;
  final InternetConnectionService connection;

  LoginWithEmailImpl({required this.connection, required this.repository});

  @override
  Future<Either<Failure, UserModel?>> call(
      {required LoginCredential credential}) async {
    var conn = await connection.isConnected();
    if (conn.isRight()) {
      if (!credential.isValidEmail || !credential.isValidPassword) {
        return left(InvalidCredentialFailure(message: 'Credenciais inválidas'));
      } else {
        return await repository.loginWithEmail(
            email: credential.userEmail, password: credential.userPassword);
      }
    } else {
      return left(InternetFailure('Falha de conexão, por favor conecte-se'));
    }
  }
}
