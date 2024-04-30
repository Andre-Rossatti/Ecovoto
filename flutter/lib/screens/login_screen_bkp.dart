import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  void _trySubmitForm() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      // Aqui você pode adicionar a lógica de autenticação
    }
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login_background.webp"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center( // Centraliza o conteúdo na tela
        child: SingleChildScrollView( // Garante que a tela seja rolável se o teclado cobrir o conteúdo
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85, // Define a largura máxima do Card em 85% da largura da tela
                child: Card(
                  elevation: 5.0, // Sombra do Card
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        FlutterLogo(size: 100),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Implementar a lógica de login
                          },
                          child: Text('Entrar'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navegar para a tela de criação de conta
                          },
                          child: Text('Criar conta'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}
