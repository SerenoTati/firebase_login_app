import 'dart:developer';
// import 'dart:math';

import 'package:firebase_login/app/modules/login/domain/models/login_credential.dart';
import 'package:firebase_login/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:flutter/material.dart';

class EmailAndPasswordLoginController extends ChangeNotifier {
  final LoginWithEmail loginUsecase;
  String _email = '';
  String _password = '';
  EmailAndPasswordLoginController({required this.loginUsecase});

  void setEmail(String email) {
    _email = email;

    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    // log(_password);
    notifyListeners();
  }

  LoginCredential get _credential =>
      LoginCredential.loginWithEmail(email: _email, password: _password);

  Future<void> login() async {
    var res = await loginUsecase(credential: _credential);
    // log(credential.userEmail);
    res.fold((l) => log('Failure'), (r) => log('${r?.email}'));
  }
}
