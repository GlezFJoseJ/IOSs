import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 0, 0)),
        useMaterial3: true,
      ),
      home: const Login(title: 'Login'),
    );
  }
}

class SecondForm extends StatelessWidget {
  final String login;
  final String password;

  SecondForm({required this.login, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Bienvenido usuario: $login'),
            Text(''),
            Text('Su contraseña es: $password'),
            Text(''),
            Text('¿Qué desea hacer?'),
            Text(''),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Para volver al formulario de login
              },
              child: Text('Regresar al login'),
            ),
          ],
        ),
      ),
    );
  }
}
