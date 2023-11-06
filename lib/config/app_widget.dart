import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/config/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.note,
      routes: AppRoutes.routes,
    );
  }
}
