import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_login/app/modules/login/domain/models/phone_verification_model.dart';
import 'package:firebase_login/app/modules/login/domain/models/user_model.dart';
import 'package:firebase_login/app/modules/login/infra/datasource/login_datasource.dart';

class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseAuth authObject;

  LoginDataSourceImpl({required this.authObject});
  @override
  Future<UserModel?> loginWithEmail(
      {required String email, required String password}) async {
    try {
      var res = await authObject.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel user = UserModel(
        displayName: res.user!.displayName,
        email: '',
        emailVerified: res.user!.emailVerified,
        isAnonymous: res.user!.isAnonymous,
        // metadata: res.user.metadata,
        // multiFactor: res.user.multiFactor,
        phoneNumber: res.user!.phoneNumber,
        photoURL: res.user!.photoURL,
        // providerData: [],
        refreshToken: res.user?.refreshToken,
        tenantId: res.user!.tenantId,
        uid: res.user!.uid,
      );
      return user;
    } on FirebaseAuthException catch (_, e) {
      log('FirebaseAuthException $e');

      return null;
    }
  }

  @override
  Future<UserModel> loginWithUsername(
      {required String name, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> loginWithGoogle({required String googleAccount}) {
    throw UnimplementedError();
  }

  // @override
  // Future<PhoneVerificationResponseModel?> loginWithPhoneNumber(
  //     {required String phoneNumber}) async {
  //   // authObject.signInWithPhoneNumber(phoneNumber)
  //   var signInRequest = await authObject.signInWithPhoneNumber(phoneNumber);
  //   signInRequest.verificationId;
  //   // Auth
  //   // signInRequest.
  // }

  @override
  Future<UserModel?> verifyPhone({required String phoneNumber}) async {
    UserModel? user;
    // Exception excep;
    // String verifId;
    authObject.verifyPhoneNumber(
        timeout: const Duration(minutes: 5),
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneCredential) async {
          // phoneCredential.smsCode;
          // phoneCredential.verificationId;
          // phoneCredential.providerId;
          // phoneCredential.signInMethod;
          // phoneCredential.token;
          var request = await authObject.signInWithCredential(phoneCredential);

          user = UserModel(
            emailVerified: request.user!.emailVerified,
            isAnonymous: request.user!.isAnonymous,
            refreshToken: request.user!.refreshToken,
            tenantId: request.user!.tenantId,
            uid: request.user!.uid,
            displayName: request.user!.displayName,
            email: request.user!.email,
            phoneNumber: request.user!.phoneNumber,
            photoURL: request.user!.photoURL,
          );
        },
        verificationFailed: (FirebaseAuthException exception) {
          user = null;
        },
        codeSent: (String verificationId, int? resendToken) {
          // verifId = verificationId;
        },
        codeAutoRetrievalTimeout: (String codeAutoRetrievalTimeout) {});
    return user;
  }
}
