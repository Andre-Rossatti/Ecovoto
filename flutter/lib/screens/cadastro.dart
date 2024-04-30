import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(RegisterApp());
}

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Defina as configurações do seu aplicativo aqui
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String fullName = '';
  String voterId = '';
  String city = '';
  bool acceptTerms = false;
  bool acceptAI = false;

  void _trySubmitForm() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      // Aqui você pode adicionar a lógica para enviar os dados do formulário
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color customColor = Color(0xFF009C3B);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: FadeInUp(
                        duration: Duration(milliseconds: 1600),
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Image.asset('assets/images/logo.png',
                                height: 100),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      FadeInUp(
                        duration: Duration(milliseconds: 1800),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: customColor),
                            boxShadow: [
                              BoxShadow(
                                color: customColor.withOpacity(0.2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: customColor)),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700]),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor, insira seu email';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: customColor)),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nome Completo",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700]),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor, insira seu nome completo';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      fullName = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: customColor)),
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Número do Título de Eleitor",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700]),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor, insira seu número de título de eleitor';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      voterId = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Cidade",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[700]),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Por favor, insira sua cidade';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      city = value;
                                    });
                                  },
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: acceptTerms,
                                    onChanged: (value) {
                                      setState(() {
                                        acceptTerms = value!;
                                      });
                                    },
                                  ),
                                  Text("Eu aceito os termos de política e privacidade desse aplicativo."),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: acceptAI,
                                    onChanged: (value) {
                                      setState(() {
                                        acceptAI = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                      "Eu aceito o uso da Inteligência Artificial como recurso de informações."),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      FadeInUp(
                        duration: Duration(milliseconds: 1900),
                        child: GestureDetector(
                          onTap: _trySubmitForm,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  customColor,
                                  customColor.withOpacity(0.6),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
