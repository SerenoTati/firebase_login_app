import 'package:dartz/dartz.dart';
import 'package:firebase_login/app/modules/login/domain/models/login_credential.dart';
import 'package:firebase_login/app/modules/login/domain/repository/login_repository.dart';
import 'package:firebase_login/app/modules/login/domain/usecases/login_with_username.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../data_mocks.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

void main() {
  var repositoryMock = LoginRepositoryMock();

  var usecase = LoginWithUsernameImpl(repositoryMock);
  test('Successfully return a UserData from firebase request', () async {
    when(() =>
            repositoryMock.loginWithUsername(name: 'Sereno', password: '1234'))
        .thenAnswer((_) async => Right(user));
    var res = await usecase(
      credential: LoginCredential.loginWithUsername(
        name: 'Sereno',
        password: '1234',
      ),
    );
    String accoutUsername = '';
    res.map((r) => accoutUsername = r.displayName.toString());

    expect('Sereno Pla', accoutUsername);
  });
}
