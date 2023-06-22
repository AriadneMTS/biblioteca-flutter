import 'package:biblioteca/infra/cliente_http.dart';
import 'package:biblioteca/models/livro.dart';

class LivroRemote {
  final link =
      "http://127.0.0.1:8000/api/livros";

  Future<List<Livro>> get() async {
    var dados = await ClienteHttp().getJson(link);

    return dados.map((e) => Livro.fromMap(e)).toList();
  }

  Future<List<Livro>> getByRa(String ra) async {
    var dados = await ClienteHttp().getJson("$link/$ra");

    return dados.map((e) => Livro.fromMap(e)).toList();
  }

  Future<List<Livro>> show() async {
    var dados = await ClienteHttp().getJson(link);

    return dados.map((e) => Livro.fromMap(e)).toList();
  }

}



