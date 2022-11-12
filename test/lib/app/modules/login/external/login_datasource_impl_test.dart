import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/app/modules/login/external/datasource/login_datasource_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'com.simdev.login_firebase',
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCgXCtBQnn_Uca3VCW8jVwUIZ_LLT9u_lw',
      appId: '1:82955388052:android:6b902f7b0b8f911ac6a081',
      messagingSenderId: '82955388052',
      projectId: 'login-firebase-3eba6',
    ),
  );
  var authObject = FirebaseAuth.instance;
  var dataSource = LoginDataSourceImpl(authObject: authObject);
  test('Autenticar ususario no serviço do Firebase Authentication', (() async {
    var user = await dataSource.loginWithEmail(
        email: 'serenopla@hotmail.com', password: 'MoneyTree_22');
    expect('serenopla@hotmail.com', user!.email);
  }));
}
