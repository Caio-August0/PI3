import 'package:flutter/material.dart';
import 'package:projeto_teste/seleção/selecao.dart';

class Descricao extends StatelessWidget {
  const Descricao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Text("Descrição do crime"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Selecao()),
              );
            },
            child: Text("Continuar"),
          ),
        ])));
  }
}
