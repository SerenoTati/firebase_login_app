import 'package:firebase_login/app/modules/login/presenter/controllers/email_and_password_login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_text_widget.dart';

class LoginSreen extends StatelessWidget {
  const LoginSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailAndPasswordLoginController =
        Provider.of<EmailAndPasswordLoginController>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: [
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextWidget(
                        onChange: emailAndPasswordLoginController.setEmail,
                        hintText: 'example@mail.com',
                        icon: Icons.email),
                    CustomTextWidget(
                      onChange: emailAndPasswordLoginController.setPassword,
                      hintText: 'Introduza a sua palavra-passe',
                      icon: Icons.password,
                      isPassword: true,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await emailAndPasswordLoginController.login();
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
