import 'package:dartz/dartz.dart';
import 'package:firebase_login/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login/app/modules/login/domain/models/login_credential.dart';
import 'package:firebase_login/app/modules/login/domain/models/user_model.dart';
import 'package:firebase_login/app/modules/login/domain/repository/login_repository.dart';

abstract class LoginWithUsername {
  Future<Either<Failure, UserModel>> call(
      {required LoginCredential credential});
}

class LoginWithUsernameImpl implements LoginWithUsername {
  final LoginRepository repository;

  LoginWithUsernameImpl(this.repository);
  @override
  Future<Either<Failure, UserModel>> call(
      {required LoginCredential credential}) async {
    if (!credential.isValidUsername || !credential.isValidPassword) {
      return left(
        InvalidCredentialFailure(
          message: 'Nome de usuario ou palavra-passe vazia, preencha os campos',
        ),
      );
    }
    return await repository.loginWithUsername(
        name: credential.userName, password: credential.userPassword);
  }
}
