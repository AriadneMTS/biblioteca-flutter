import 'dart:convert';
import 'package:http/http.dart' as http;

class ClienteHttp {

  Future<List<dynamic>> getJson(String link) async {
    //busca os dados da API e await faz aguardar a execução da thread
    var response = await http.get(Uri.parse(link));

    // pegando a resposta da API r decodificando o Json
    return json.decode(response.body);
  }
}