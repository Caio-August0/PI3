// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_teste/seleção/selecao.dart';
import '../components/button.dart';

class Descricao extends StatelessWidget {
  const Descricao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2C2C2C),
        body: Stack(children: [
          Align(
            alignment: Alignment(-1, 1),
            child: Image.asset("images/foot.png"),
          ),
          Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Container(
                  height: 400,
                  width: 300,
                  margin: EdgeInsets.only(bottom: 50),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(128, 217, 217, 217),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(9))),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'História ...',
                      style: GoogleFonts.inika(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ButtonGray(context: context, toGo: Selecao(), text: "Avançar"),
              ])),
        ]));
  }
}
