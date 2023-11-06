import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:note_app/app/login/services/login_services.dart';
import 'package:note_app/app/login/store/login_store.dart';
import 'package:note_app/app/login/view/login_form_input_widget.dart';
import 'package:note_app/app/shared/widgets/privacy_policy_widget.dart';
import 'package:note_app/config/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginServices _loginServices;
  late final LoginStore _store;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _loginServices = LoginServices();
    _store = LoginStore(loginServices: _loginServices);
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff1e4e62),
            Color(0xff2e968f),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginFormInputWidget(
                  controller: _store.loginController,
                  icon: Icons.person,
                  label: 'Usuário',
                  isObscureText: false,
                  validator: (value) =>
                      RegExp(r'^[^\s]{1,20}$').hasMatch(value ?? '')
                          ? null
                          : 'Preencha um usuário válido'),
              LoginFormInputWidget(
                  controller: _store.passwordController,
                  icon: Icons.lock,
                  label: 'Senha',
                  isObscureText: true,
                  validator: (value) => RegExp(r'^[0-9a-zA-Z]{2,20}$')
                          .hasMatch(value ?? '')
                      ? null
                      : 'Preencha uma senha em formato valido, apenas números e letras'),
              Observer(builder: (_) {
                return ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0Xff44bd6e))),
                  onPressed: _store.state == LoginState.loading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            _store.login().then((value) => _store.state ==
                                    LoginState.success
                                ? Navigator.pushReplacementNamed(
                                    context, AppRoutes.note)
                                : ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    content: Text('Usuário ou senha incorreto'),
                                    backgroundColor: Colors.red,
                                  )));
                          }
                        },
                  child: _store.state != LoginState.loading
                      ? const Text('Entrar')
                      : Transform.scale(
                          scale: 0.7,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                );
              }),
            ],
          ),
        ),
        bottomNavigationBar: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [PrivacyPolicyWidget()],
        ),
      ),
    );
  }
}
