// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_teste/data/request_manager.dart';
import 'package:projeto_teste/logger/logger.dart';
import 'package:projeto_teste/suspeitos-data/data_manager.dart';
import 'package:logger/logger.dart';
import 'package:projeto_teste/suspeitos-data/dbGameHandler.dart';

class Suspeito extends StatefulWidget {
  final DadosSuspect suspect;

  const Suspeito({required this.suspect, super.key});

  @override
  State<Suspeito> createState() => _SuspeitoState();
}

class _SuspeitoState extends State<Suspeito> {
  String _suspectText = '';
  TextEditingController controlas = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _suspectText = widget.suspect.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          widget.suspect.name,
          style: GoogleFonts.inika(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff2C2C2C),
      ),
      backgroundColor: Color(0xff2C2C2C),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 220,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(128, 217, 217, 217),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(9))),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _suspectText,
                            style: GoogleFonts.inika(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: controlas,
                      style: GoogleFonts.inika(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Pergunte algo...',
                        labelText: 'Detetive:',
                        focusColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelStyle: GoogleFonts.inika(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintStyle: GoogleFonts.inika(
                          color: Colors.grey,
                        ),
                      ),
                      onSubmitted: (value) async {
                        setState(() {
                          _suspectText = '$_suspectText\nDetetive: $value';
                          controlas.text = '';
                        });
                        String message = await enviarMensagem(
                            contructMensage(widget.suspect, _suspectText));
                        setState(() {
                          _suspectText =
                              '$_suspectText\n${widget.suspect.name}: $message';
                        });
                        widget.suspect.text = _suspectText;
                        final count = await DbGameHandler.instance
                            .updateSuspect(widget.suspect);
                        if (count < 1) {
                          await DbGameHandler.instance
                              .addSuspect(widget.suspect);
                        }
                        print(count);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
