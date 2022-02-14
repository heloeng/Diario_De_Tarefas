
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:teste/src/src.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String senha = "";
  String error = "";

  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );
  bool obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    color: Color(0xffd17842),
                                  ),
                                  labelText: 'Email'),
                              onChanged: (texto) => email = texto,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.enhanced_encryption_outlined,
                                    color: Color(0xffd17842),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obscureTextPassword =
                                            !obscureTextPassword;
                                      });
                                    },
                                    icon: obscureTextPassword
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                  ),
                                  labelText: 'Senha'),
                              obscureText: obscureTextPassword,
                              onChanged: (texto) => senha = texto,
                            ),
                            const SizedBox(height: 15),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: ElevatedButton(
                                onPressed: () async {
                                  try {
                                    await userController.login(email, senha);
                                  } on FirebaseAuthException catch (e) {
                                    var msg = "";

                                    if (e.code == "wrong-password") {
                                      msg = "A senha está incorreta";
                                    } else if (e.code == "invalid-email") {
                                      msg = "Email inválido";
                                    } else if (e.code == "user-not-found") {
                                      msg = "Usuário não cadastrado";
                                    } else if (e.code == "too-many-requests") {
                                      msg = "Tente novamente mais tarde";
                                    } else if (e.code ==
                                        "operation-not-allowed") {
                                      msg =
                                          "Login com email e senha não está habilitado";
                                    } else {
                                      msg =
                                          "Informe seu email e senha de cadastro";
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(msg),
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffd17842)),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignupPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Criar conta",
                                  style: GoogleFonts.blackOpsOne(
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFFB6C34),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: OutlinedButton(
                                onPressed: () async {
                                  try {
                                    await userController.updateSenha(
                                        email, context);
                                  } on FirebaseAuthException catch (e) {
                                    var msg = "";
                                    if (e.code == "invalid-email") {
                                      msg = "Email inválido";
                                    } else if (e.code == "user-not-found") {
                                      msg = "Usuário não cadastrado";
                                    } else {
                                      msg = "Informe seu email de cadastro";
                                      print(msg);
                                    }
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(msg),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Esqueci a senha",
                                  style: GoogleFonts.blackOpsOne(
                                    textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFFFB6C34),
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
          ),
        ],
      ),
    );
  }
}
