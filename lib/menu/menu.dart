// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_teste/seleção/selecao.dart';
import 'package:projeto_teste/descrição/descricao.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C2C2C),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(-1, 1),
            child: Image.asset("images/foot.png"),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Detetive",
                  style: GoogleFonts.inika(
                    fontSize: 55.0,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 70),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: const [
                            Color.fromARGB(255, 47, 47, 47),
                            Color.fromARGB(255, 47, 46, 46),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          tileMode: TileMode.decal),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "images/logo.png",
                      width: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: buttonGray(context, Descricao(), "Iniciar"),
                ),
                buttonGray(context, Confg(), "Opções")
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buttonGray(BuildContext context, Widget toGo, String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.zero),
        border: Border.all(width: 3, color: Color.fromARGB(255, 150, 150, 150)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.0,
            blurRadius: 5.0,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Color(0xff2C2C2C)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          textStyle: MaterialStateProperty.all(GoogleFonts.inika(
            color: Colors.white,
          )),
          minimumSize: MaterialStatePropertyAll(Size(100, 46)),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => toGo),
          );
        },
        child: Text(text),
      ),
    );
  }
}

// Implementar histórico
class Historico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
      ),
      body: Center(
        child: Text('Implementar Histórico'),
      ),
    );
  }
}

class Confg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Center(
        child: Text('Implementar Configurações'),
      ),
    );
  }
}
