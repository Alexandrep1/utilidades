import 'package:flutter/material.dart';
import 'package:utilidades/src/app/app_routes.dart';
import 'package:utilidades/src/services/auth_service.dart';
import 'package:utilidades/src/views/clima_view.dart';
import 'package:utilidades/src/views/login_view.dart';

class AppWidgets extends StatelessWidget {
  const AppWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utilidades',
      initialRoute: AuthService.isLoggedIn ? '/home' : '/login',
      routes: {
        "/login": (context) => LoginView(),
        ...generateRoutes(),
        '/clima': (context) => TelaClima(),
      },
    );
  }
}