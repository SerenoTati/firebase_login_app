import 'package:dartz/dartz.dart';
import 'package:firebase_login/app/modules/login/domain/errors/errors.dart';

abstract class InternetConnectionService {
  Future<Either<Failure, Unit>> isConnected();
}
