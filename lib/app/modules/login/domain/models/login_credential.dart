// import 'package:firebase_login/app/modules/login/domain/models/phone_verification_model.dart';
import 'package:string_validator/string_validator.dart' as validator;

class LoginCredential {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userPassword;
  final String googleAccount;
  // final PhoneVerificationResponseModel phoneVerification;

  const LoginCredential._(
      {this.userPhone = '',
      this.googleAccount = '',
      this.userName = '',
      this.userEmail = '',
      this.userPassword = ''});

  bool get isValidUsername => userName.isNotEmpty;
  bool get isValidPassword => userPassword.isNotEmpty;
  bool get isValidEmail => userEmail.isNotEmpty && validator.isEmail(userEmail);
  bool get isValidPhoneNumber =>
      validator.isNumeric(userPhone) && validator.isLength(userPhone, 9);

  bool get isVallidGoogleAccount =>
      googleAccount.isNotEmpty &&
      validator.isEmail(googleAccount) &&
      googleAccount.endsWith('@gmail.com');
  // validator.en(googleAccount, '.gmail.com');

  factory LoginCredential.loginWithEmail(
      {required String email, required String password}) {
    return LoginCredential._(
      userEmail: email,
      userPassword: password,
    );
  }

  factory LoginCredential.loginWithUsername(
      {required String name, required String password}) {
    return LoginCredential._(
      userName: name,
      userPassword: password,
    );
  }

  factory LoginCredential.loginWithPhoneNumber({required String userPhone}) {
    return LoginCredential._(
      userPhone: userPhone,
    );
  }
  factory LoginCredential.loginWithGoogle({required String googleAccount}) {
    return LoginCredential._(
      googleAccount: googleAccount,
    );
  }
}
