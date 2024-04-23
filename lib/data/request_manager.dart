import 'dart:convert';
import 'package:dio/dio.dart';

Future<String> enviarMensagem(String mensagem) async {
  const String url = 'http://10.0.2.2:8000/prompt_mensage';

  Dio dio = Dio();

  final response = await dio
      .put(
        url,
        data: jsonEncode({'prompt': mensagem}),
      )
      .timeout(const Duration(minutes: 10));

  if (response.statusCode == 200) {
    return response.data as String;
  } else {
    throw Exception('Falha ao enviar mensagem');
  }
}

// teste da API 
// Future<void> main() async {
//   var mensage = await enviarMensagem("oi, belezura?");
//   print(mensage);
// }
