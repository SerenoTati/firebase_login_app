import 'package:firebase_login/app/modules/login/domain/models/user_model.dart';

// import '../../domain/models/phone_verification_model.dart';

abstract class LoginDataSource {
  Future<UserModel> loginWithUsername(
      {required String name, required String password});
  Future<UserModel?> loginWithEmail(
      {required String email, required String password});
  Future<UserModel?> loginWithGoogle({required String googleAccount});
  // Future<PhoneVerificationResponseModel?> loginWithPhoneNumber(
  //     {required String phoneNumber});
  Future<UserModel?> verifyPhone({required String phoneNumber});
}
