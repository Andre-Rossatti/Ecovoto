import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/cadastro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Meu App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),

        '/cadastro': (context) => RegisterApp(),
        // Defina outras rotas aqui
      },
    );
  }
}
