import 'dart:developer';

import 'package:firebase_login/app/modules/login/domain/repository/login_repository.dart';
import 'package:firebase_login/app/modules/login/infra/datasource/login_datasource.dart';
import 'package:firebase_login/app/modules/login/infra/repostories/login_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../data_mocks.dart';

class LoginDatasourceMock extends Mock implements LoginDataSource {}

void main() {
  LoginDataSource data = LoginDatasourceMock();
  LoginRepository repo = LoginRepositoryImpl(dataSource: data);
  test('succesfully return a userId from backend', () async {
    when((() => data.loginWithUsername(name: 'Sereno Tati', password: '1234')))
        .thenAnswer((invocation) async => user);
    String result = '';
    var request =
        await repo.loginWithUsername(name: 'Sereno Tati', password: '1234');
    request.map((r) => result = r.uid.toString());
    request.fold((l) => log('Failure'), (r) => log('success'));
    expect(1, result);
  });
}
