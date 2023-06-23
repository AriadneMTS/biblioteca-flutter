import 'package:biblioteca/models/livro.dart';
import 'package:flutter/material.dart';

//Stateless -  não faz gerencia de estado
//quando criamos widgets utilizamos stateless

class ItemLista extends StatelessWidget {
  final Livro livro;
  const ItemLista(this.livro,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(livro.titulo, style: const TextStyle(fontSize: 40),),
            ],
          )
      ),
    );
  }
}
