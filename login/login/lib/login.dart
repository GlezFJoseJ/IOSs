import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _validateLogin() {
    String login = loginController.text;
    String password = passwordController.text;

    // Verificar el nombre de usuario y la contraseña
    if (login == 'Ulises' && password == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondForm(login: login, password: password),
        ),
      );
    } else {
      // Limpiar los campos si las credenciales son incorrectas
      loginController.clear();
      passwordController.clear();

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Acceso denegado'),
            content: Text('Usuario Y/O Contraseña Incorrectos.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Agrega la imagen desde assets
            Image.asset(
              'img/1.png', // Ruta de la imagen en assets
              width: 200, // Tamaño deseado de la imagen
              height: 200,
            ),
            TextField(
              controller: loginController,
              decoration: InputDecoration(labelText: 'Login'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true, // Para ocultar la contraseña
            ),
            ElevatedButton(
              onPressed: _validateLogin,
              child: Text('Ingresar'),
            ),
          ],
        ),
      ),
    );
  }
}
