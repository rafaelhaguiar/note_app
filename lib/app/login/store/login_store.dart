// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:note_app/app/login/services/login_services.dart';

part 'login_store.g.dart';

enum LoginState {
  initial,
  loading,
  success,
  error,
}

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final LoginServices loginServices;
  LoginStoreBase({
    required this.loginServices,
  });

  @observable
  TextEditingController loginController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  LoginState state = LoginState.initial;

  @action
  Future<void> login() async {
    try {
      state = LoginState.loading;

      await loginServices.login(
          userEmail: loginController.text, password: passwordController.text);
      state = LoginState.success;
    } on Exception {
      state = LoginState.error;
    }
  }
}
