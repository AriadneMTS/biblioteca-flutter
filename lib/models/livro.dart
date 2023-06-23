

import 'package:biblioteca/models/autor.dart';

class Livro {
  int codigo;
  String titulo;
  Autor autor;


  Livro({required this.codigo, required this.titulo, required this.autor});

  factory Livro.fromMap(Map<String, dynamic> mapa) {
    print(mapa);
    return Livro(
        codigo: mapa['id'],
        titulo: mapa['titulo'] ?? '',
        autor: Autor.fromMap(mapa['autor']),);
  }
}