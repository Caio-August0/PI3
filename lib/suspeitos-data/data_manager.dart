class DadosSuspect {
  late String text;
  String name = '';
  late String img;
  late String persona;
  late String context;
  late String rela;
  late bool crime;

  var rules =
      'Regras:1.Você interpretará um personagem que está conversando com um detetive durante uma investigação de assassinato.2.Caso o detetive faça uma pergunta que fuja do tema do crime ocorrido ou da lista de informações que você sabe, você não responderá e tentará fazer com que o detetive volte ao tema.3.Você vive no Brasil no ano de 1856 e não poderá mencionar acontecimentos que ocorreram após essa data4.Você tem o conhecimento das principais notícias que qualquer pessoa comum no ano de 1856 conseguiria5.Não começe suas reposta com seu nome';

  DadosSuspect({
    this.text = '',
    this.persona = '',
    this.context = '',
    this.rela = '',
    this.name = '',
    this.img = '',
    this.crime = false,
  });
}

String contructMensage(DadosSuspect suspect, String text) {
  return "${suspect.rules} ${suspect.persona} ${suspect.rela} ${suspect.context} $text";
}
