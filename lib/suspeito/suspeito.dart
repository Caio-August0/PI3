// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:projeto_teste/data/request_manager.dart';
import 'package:projeto_teste/suspeitos-data/data_manager.dart';

class Suspeito extends StatefulWidget {
  final DadosSuspect suspect;

  const Suspeito({required this.suspect, super.key});

  @override
  State<Suspeito> createState() => _SuspeitoState();
}

class _SuspeitoState extends State<Suspeito> {
  String _suspectText = ''; // Store suspect text for state management

  @override
  void initState() {
    super.initState();
    _suspectText = widget.suspect.text; // Initialize with initial text
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.suspect.name),
      ),
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
                    // Rebuild Text widget with updated _suspectText
                    Text(_suspectText),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Pergunte algo...',
                        labelText: 'Detetive:',
                      ),
                      onSubmitted: (value) async {
                        setState(() {
                          _suspectText = '${_suspectText}\nDetetive: $value';
                        });
                        String message = await enviarMensagem(_suspectText);
                        setState(() {
                          _suspectText =
                              '${_suspectText}\n${widget.suspect.name}: $message';
                        });
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
