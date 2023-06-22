import 'package:biblioteca/datasource/remote/aluno_remote.dart';
import 'package:biblioteca/pages/livros_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _raController = TextEditingController();
  bool _isLoading = false;

  // Simulação de função de autenticação
  Future<bool> _authenticateUser(String ra) async {
    // Lógica de autenticação aqui, como chamar uma API, verificar um banco de dados, etc.
    // Retorne true se o RA for válido e o usuário for autenticado com sucesso
    // Retorne false se o RA for inválido ou a autenticação falhar

    var intRa = int.tryParse(ra)!;

    var url = Uri.parse("http://127.0.0.1:8000/api/alunos/ra/$intRa");
    var response = await http.get(url);

    // Simulação de autenticação
    bool isAuthenticated = response.statusCode == 200; // Exemplo: RA válido é '123456'

    return isAuthenticated;
  }

  void _login() async {
    String ra = _raController.text;

    // Verifica se o RA está vazio
    if (ra.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de Login'),
            content: Text('Por favor, insira seu RA.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Chama a função de autenticação
    bool isAuthenticated = await _authenticateUser(ra);

    setState(() {
      _isLoading = false;
    });

    if (isAuthenticated) {
      // Navegue para a próxima tela (listagens de livros, por exemplo)
      await Navigator.push(context, MaterialPageRoute(builder: (context) => LivrosPage(int.tryParse(ra)!)));
      setState(() {});
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de Login'),
            content: Text('RA inválido. Por favor, tente novamente.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _raController,
                decoration: InputDecoration(
                  labelText: 'RA',
                ),
              ),
              SizedBox(height: 16.0),
              _isLoading
                  ? CircularProgressIndicator() // Exibe um indicador de progresso durante a autenticação
                  : ElevatedButton(
                onPressed: _login,
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

