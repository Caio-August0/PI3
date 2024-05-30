// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_teste/seleção/selecao.dart';
import 'package:projeto_teste/descrição/descricao.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_teste/suspeito/suspeito.dart';
import 'package:projeto_teste/suspeitos-data/data_manager.dart';
import 'package:projeto_teste/suspeitos-data/dbGameHandler.dart';
import 'package:projeto_teste/suspeitos-data/suspects.dart';
import '../components/button.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var initFlag = false;

  @override
  void initState() {
    super.initState();
    verifyMemory();
  }

  Future<void> verifyMemory() async {
    await DbGameHandler.instance.initialize();
    final dbSuspects = await DbGameHandler.instance.getAllSuspects();
    for (final dbSuspeito in dbSuspects) {
      if (dbSuspeito.text != "") {
        initFlag = true;
        print(dbSuspeito.text);
        for (final suspeito in suspeitos) {
          if (suspeito.name == dbSuspeito.name) {
            suspeito.text = dbSuspeito.text;
          }
        }
      }
    }
  }

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
                  child: ButtonGray(
                    context: context,
                    toGo: Descricao(),
                    text: "Novo jogo",
                    newGame: true,
                  ),
                ),
                if (initFlag)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: ButtonGray(
                      context: context,
                      toGo: Selecao(),
                      text: "Continuar",
                      newGame: false,
                    ),
                  ),
                ButtonGray(
                  toGo: Confg(),
                  text: "Opções",
                  context: context,
                  newGame: false,
                )
              ],
            ),
          )
        ],
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
