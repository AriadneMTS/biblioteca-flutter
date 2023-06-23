

class Autor {
  int codigo;
  String nome;


  Autor ({required this.codigo, required this.nome});

  factory Autor.fromMap(Map<String, dynamic> mapa) {
    print(mapa);
    return Autor(
      codigo: mapa['id'],
      nome: mapa['nome'] ?? '',);
  }
}