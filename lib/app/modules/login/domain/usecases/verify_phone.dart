import 'package:dartz/dartz.dart';
import 'package:firebase_login/app/modules/login/domain/models/user_model.dart';
import 'package:firebase_login/app/modules/login/domain/repository/login_repository.dart';
import 'package:firebase_login/app/modules/login/domain/services/internet_connection_service.dart';

import '../errors/errors.dart';

abstract class PhoneVerification {
  Future<Either<Failure, UserModel?>> call({required String verificationCode});
}

class PhoneVerificationImpl implements PhoneVerification {
  final InternetConnectionService internetService;
  final LoginRepository repo;

  PhoneVerificationImpl({required this.internetService, required this.repo});

  @override
  Future<Either<Failure, UserModel?>> call(
      {required String verificationCode}) async {
    return await repo.verifyPhone(verificationCode: verificationCode);
  }
}
