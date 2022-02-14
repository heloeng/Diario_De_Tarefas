import 'package:teste/src/src.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

// Define a classe State que vai tratar os dados do Form
class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String nome = "";
  String email = "";
  String senha = "";

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
          "Criar conta",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Cria o widget Form usando  _formKey
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              // O validador recebe o texto digitado
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_add_alt,
                                  color: Color(0xffd17842),
                                ),
                                labelText: 'Nome',
                              ),
                              onChanged: (texto) => nome = texto,
                              validator: (String? texto) {
                                if (texto != null && texto.isNotEmpty) {
                                  if (texto.length < 3) {
                                    return "Digite um Nome válido.";
                                  }
                                } else {
                                  return "Campo obrigatório.";
                                }
                              },
                            ),
                            TextFormField(
                              validator: (String? texto) {
                                if (texto != null && texto.isNotEmpty) {
                                  if (!texto.contains('@') ||
                                      texto.length < 8) {
                                    return 'Digite um email válido';
                                  }
                                } else {
                                  return 'Campo obrigatório.';
                                }
                              },
                              onChanged: (texto) => email = texto,
                              style: const TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Color(0xffd17842),
                                ),
                                labelText: 'Email',
                              ),
                            ),
                            TextFormField(
                              onChanged: (texto) => senha = texto,
                              obscureText: obscureTextPassword,
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
                                labelText: 'Senha',
                              ),
                              validator: (String? texto) {
                                if (texto != null && texto.isNotEmpty) {
                                  if (texto.length < 6) {
                                    return "Digite uma senha com 6 caracteres ou mais";
                                  }
                                } else {
                                  return "Campo obrigatório";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final user = UserModel(nome: nome);
                                await userController.signup(email, senha, user);

                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xffd17842),
                              ),
                              child: const Text("Criar conta",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Tenho Cadastro",
                                  style: GoogleFonts.blackOpsOne(
                                    textStyle: const TextStyle(
                                      fontSize: 24,
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
