import 'package:firebase_login/app/modules/login/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_login/app/modules/login/domain/services/internet_connection_service.dart';

import '../drivers/internet_driver.dart';

class InternetServiceImpl implements InternetConnectionService {
  final InternetDriver internetDriver;

  InternetServiceImpl({required this.internetDriver});
  @override
  Future<Either<Failure, Unit>> isConnected() async {
    var connection = await internetDriver.isOnline();
    if (connection) {
      return const Right(unit);
    } else {
      return Left(InternetFailure('No internet Connection'));
    }
  }
}
