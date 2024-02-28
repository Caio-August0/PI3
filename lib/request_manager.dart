import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data_manager.dart';

class Mensage {
  final String mensage;

  Mensage({required this.mensage});

  Map<String, dynamic> toJson() => {
        'mensage': mensage,
      };
}

Future<String> mensageSend(DadosSuspect suspeito) async {
  final url = Uri.parse('http://127.0.0.1:4433/prompt_mensage');
  final body = {'prompt': suspeito.text};

  final response = await http.put(
    url,
    body: jsonEncode(body),
    headers: {'Content-Type': 'application/json'},
  ).timeout(const Duration(minutes: 10));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    return "ERRO MALUUUCOOOA  AA A A A";
  }
}
