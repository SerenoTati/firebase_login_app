import 'package:dartz/dartz.dart';
// import 'package:firebase_login/app/modules/login/domain/models/phone_verification_model.dart';
import 'package:firebase_login/app/modules/login/domain/models/user_model.dart';
import 'package:firebase_login/app/modules/login/domain/errors/errors.dart';
import 'package:firebase_login/app/modules/login/domain/repository/login_repository.dart';
import 'package:firebase_login/app/modules/login/infra/datasource/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, UserModel?>> loginWithEmail(
      {required String email, required String password}) async {
    return right(
        await dataSource.loginWithEmail(email: email, password: password));
  }

  @override
  Future<Either<Failure, UserModel>> loginWithUsername(
      {required String name, required String password}) async {
    return right(
        await dataSource.loginWithUsername(name: name, password: password));
  }

  @override
  Future<Either<Failure, UserModel?>> loginWithGoogleAccount(
      {required String googleAccount}) async {
    return right(
        await dataSource.loginWithGoogle(googleAccount: googleAccount));
  }

  // @override
  // Future<Either<Failure, PhoneVerificationResponseModel?>> loginWithPhoneNumber(
  //     {required String phone}) async {
  //   return right(await dataSource.loginWithPhoneNumber(phoneNumber: phone));
  // }

  @override
  Future<Either<Failure, UserModel?>> verifyPhone(
      {required String verificationCode}) async {
    return right(await dataSource.verifyPhone(phoneNumber: verificationCode));
  }
}
