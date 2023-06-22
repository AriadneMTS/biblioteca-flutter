

class Livro {
  int codigo;
  String titulo;


  Livro({required this.codigo, required this.titulo});

  factory Livro.fromMap(Map<String, dynamic> mapa) {
    return Livro(
        codigo: mapa['id'],
        titulo: mapa['titulo'] ?? '');
  }
}