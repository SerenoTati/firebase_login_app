// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app_widget.dart';

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
  
  runApp(const AppWidget());
}
