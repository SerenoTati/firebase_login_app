import 'package:dartz/dartz.dart';
import 'package:firebase_login/app/modules/login/domain/errors/errors.dart';
// import 'package:firebase_login/app/modules/login/domain/models/phone_verification_model.dart';

import '../models/user_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserModel>> loginWithUsername(
      {required String name, required String password});
  Future<Either<Failure, UserModel?>> loginWithEmail(
      {required String email, required String password});

  Future<Either<Failure, UserModel?>> loginWithGoogleAccount(
      {required String googleAccount});
  Future<Either<Failure, UserModel?>> verifyPhone(
      {required String verificationCode});

  // Future<Either<Failure, PhoneVerificationResponseModel?>> loginWithPhoneNumber(
  //     {required String phone});
}
