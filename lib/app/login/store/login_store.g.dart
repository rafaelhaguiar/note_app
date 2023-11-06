// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$loginControllerAtom =
      Atom(name: 'LoginStoreBase.loginController', context: context);

  @override
  TextEditingController get loginController {
    _$loginControllerAtom.reportRead();
    return super.loginController;
  }

  @override
  set loginController(TextEditingController value) {
    _$loginControllerAtom.reportWrite(value, super.loginController, () {
      super.loginController = value;
    });
  }

  late final _$passwordControllerAtom =
      Atom(name: 'LoginStoreBase.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$stateAtom = Atom(name: 'LoginStoreBase.state', context: context);

  @override
  LoginState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LoginState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginStoreBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  @override
  String toString() {
    return '''
loginController: ${loginController},
passwordController: ${passwordController},
state: ${state}
    ''';
  }
}
