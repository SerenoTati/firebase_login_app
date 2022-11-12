import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:firebase_login/app/modules/login/external/datasource/login_datasource_impl.dart';
import 'package:firebase_login/app/modules/login/external/drivers/internet_driver_impl.dart';
import 'package:firebase_login/app/modules/login/infra/repostories/login_repository_impl.dart';
import 'package:firebase_login/app/modules/login/infra/services/internet_service_impl.dart';

import 'presenter/controllers/email_and_password_login_controller.dart';

// var authObject = FirebaseAuth.instance;
// LoginDataSource datasource = LoginDataSourceImpl(authObject: authObject);
// LoginRepository repo = LoginRepositoryImpl(dataSource: datasource);
// Connectivity connectionDiver = Connectivity();
// InternetDriver internetDriver =
//     InternetDriverImpl(internerDriverObject: connectionDiver);
// InternetConnectionService connService =
//     InternetServiceImpl(internetDriver: internetDriver);
// LoginWithEmail usecase =
//     LoginWithEmailImpl(repository: repo, connection: connService);
// var emailAndPasswordLogincontroller =
//     EmailAndPasswordLoginController(loginUsecase: usecase);

List<Provider> loginBinds = [
  Provider(create: (_) => FirebaseAuth.instance),
  Provider(create: (ctxt) => LoginDataSourceImpl(authObject: ctxt.read())),
  Provider(create: (ctxt) => LoginRepositoryImpl(dataSource: ctxt.read())),
  Provider(create: (ctxt) => Connectivity()),
  Provider(
      create: (ctxt) => InternetDriverImpl(internerDriverObject: ctxt.read())),
  Provider(create: (ctxt) => InternetServiceImpl(internetDriver: ctxt.read())),
  Provider(
      create: (ctxt) =>
          LoginWithEmailImpl(connection: ctxt.read(), repository: ctxt.read())),
  Provider(
      create: (ctxt) =>
          EmailAndPasswordLoginController(loginUsecase: ctxt.read())),
];
