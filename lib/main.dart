import 'package:flutter/material.dart';
import 'suspects.dart';
import 'request_manager.dart';

void main() {
  runApp(const MyApp());
}

// Root do app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SelectScreen(), // Use SelectScreen directly
      ),
    );
  }
}

// Configuração da tela onde acontecerão os dialogos com os suspeitos
// @params
// name: nome do suspeito
// color: cor da appBar
// text: texto a ser exibido na pagina(historico de mensagens com o suspeito)
class DialogScreen extends StatefulWidget {
  final String name;
  final Color color;
  final String text;

  const DialogScreen({
    super.key,
    required this.name,
    required this.color,
    required this.text,
  });

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  final _textController = TextEditingController();
  String userInput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Text(suspeito1.text),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: _textController,
              autocorrect: true,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Digite sua pergunta",
              ),
              onSubmitted: (text) async {
                suspeito1.text = await mensageSend(suspeito1);
                setState(() {
                  // suspeito1.text =
                  //     suspeito1.text + '\n' + suspeito1.name + ': ' + text;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Configuração do windget de seleção de suspeitos
// @params
// name: nome do suspeito
// color: cor do windget total
// suspecttext: texto do suspeito selecionado
class SuspectFrame extends StatelessWidget {
  final Color color;
  final String name;
  final String suspecttext;

  const SuspectFrame({
    super.key,
    required this.color,
    required this.name,
    required this.suspecttext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          surfaceTintColor: Colors.transparent,
        ),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (_) => DialogScreen(
                name: name, // Ensure `name` is provided
                color: color, // Ensure `color` is provided
                text: suspecttext, // Provide default text
              ),
            ),
          );
        },
        child: null,
      ),
    );
  }
}

// Configuração da tela de seleção de suspeitos
class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Teste foda'),
      ),
      body: SizedBox(
        height: 500.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: HorizontalCircularListCarousel(
            children: [
              SuspectFrame(
                color: Colors.red,
                name: suspeito1.name,
                suspecttext: suspeito1.text,
              ),
              SuspectFrame(
                color: Colors.blue,
                name: suspeito2.name,
                suspecttext: suspeito2.text,
              ),
              SuspectFrame(
                color: Colors.green,
                name: suspeito3.name,
                suspecttext: suspeito3.text,
              ),
              SuspectFrame(
                color: Colors.yellow,
                name: suspeito4.name,
                suspecttext: suspeito4.text,
              ),
              // continuar com os outros suspeitos
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// Confirguração do carrosel da lista "infinita" de seleção de suspeitos
class HorizontalCircularListCarousel extends StatefulWidget {
  final List<Widget> children;

  const HorizontalCircularListCarousel({
    super.key,
    required this.children,
  });

  @override
  State<HorizontalCircularListCarousel> createState() =>
      _HorizontalCircularListCarouselState();
}

class _HorizontalCircularListCarouselState
    extends State<HorizontalCircularListCarousel> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      itemBuilder: (context, index) {
        int actualIndex = index % widget.children.length;
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: widget.children[actualIndex],
        );
      },
    );
  }
}
