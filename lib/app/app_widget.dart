import 'package:firebase_login/app/modules/login/login_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/login/presenter/screens/login_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...loginBinds],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginSreen(),
      ),
    );
  }
}
