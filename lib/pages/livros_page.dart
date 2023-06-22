import 'package:biblioteca/datasource/remote/aluno_remote.dart';
import 'package:biblioteca/datasource/remote/biblioteca_remote.dart';
import 'package:biblioteca/models/aluno.dart';
import 'package:biblioteca/models/livro.dart';
import 'package:biblioteca/pages/detalhes_page.dart';
import 'package:biblioteca/widgets/circulo_espera.dart';
import 'package:biblioteca/widgets/item_lista.dart';
import 'package:flutter/material.dart';

class LivrosPage extends StatefulWidget {
  final int ra;

  const LivrosPage(this.ra, {Key? key}) : super(key: key);

  @override
  State<LivrosPage> createState() => _LivrosPageState();
}

class _LivrosPageState extends State<LivrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ra.toString()),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: LivroRemote().getByRa(widget.ra.toString()!),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CirculoEspera();
              default:
                if (snapshot.hasError) {
                  return Text('Deu erro: ${snapshot.error}');
                }
                return _criarLista(snapshot.data!);
            }
          }
      ),
    );;
  }

  Widget _criarLista(List<Livro> listaDados) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector( //add click na tela
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetalhesPage(listaDados![index])));
              },
              child: ItemLista(listaDados[index]),
            ),
          );
        });
  }
}
