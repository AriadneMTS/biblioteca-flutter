import 'package:biblioteca/infra/cliente_http.dart';
import 'package:biblioteca/models/aluno.dart';

class AlunoRemote {
  final link =
      "http://127.0.0.1:8000/api/alunos/ra/";

  Future<List<Aluno>> get(int ra) async {
    var dados = await ClienteHttp().getJson("$link/$ra");

    return dados.map((e) => Aluno.fromMap(e)).toList();
  }
}



