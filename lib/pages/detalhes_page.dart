import 'package:biblioteca/models/livro.dart';
import 'package:flutter/material.dart';

class DetalhesPage extends StatefulWidget {
  final Livro livro;

  const DetalhesPage(this.livro, {Key? key}) : super(key: key);

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.livro.titulo),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(children: [
        Text(widget.livro.titulo),
      ]),
    );
  }
}
