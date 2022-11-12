// import 'package:dartz/dartz.dart';
// import 'package:firebase_login/app/modules/login/domain/errors/errors.dart';
// import 'package:firebase_login/app/modules/login/domain/models/login_credential.dart';
// import 'package:firebase_login/app/modules/login/domain/models/phone_verification_model.dart';

// import '../repository/login_repository.dart';
// import '../services/internet_connection_service.dart';

// abstract class LoginWithPhoneNumber {
//   Future<Either<Failure, PhoneVerificationResponseModel?>> call(
//       LoginCredential credential);
// }

// class LoginWithPhoneNumberImpl implements LoginWithPhoneNumber {
//   final LoginRepository repo;
//   final InternetConnectionService connection;

//   LoginWithPhoneNumberImpl(this.repo, this.connection);
//   @override
//   Future<Either<Failure, PhoneVerificationResponseModel?>> call(
//       LoginCredential credential) async {
//     var checkConn = await connection.isConnected();
//     if (credential.isValidPhoneNumber) {
//       if (checkConn.isRight()) {
//         return await repo.loginWithPhoneNumber(phone: credential.userPhone);
//       } else {
//         return left(InternetFailure('Sem conexao a internet'));
//       }
//     } else {
//       return left(
//           InvalidCredentialFailure(message: 'Numero de telefone inválido'));
//     }
//   }
// }
