import 'package:flutter/material.dart';
import 'package:note_app/app/login/view/login_page.dart';
import 'package:note_app/app/note/view/note_page.dart';

class AppRoutes {
  static const login = '/';
  static const note = '/note';

  static final Map<String, Widget Function(BuildContext)> routes = {
    login: (context) => const LoginPage(),
    note: (context) => const NotePage(),
  };
}
