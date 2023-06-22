

class Aluno {
  int codigo;
  String nome;
  int ra;


  Aluno({required this.codigo, required this.nome, required this.ra});

  factory Aluno.fromMap(Map<String, dynamic> mapa) {
    return Aluno(
        codigo: mapa['id'],
        nome: mapa['nome'] ?? '',
        ra: mapa['ra'] ?? '',
    );
  }
}