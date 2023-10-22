import 'dart:math';

/// Cria uma frase aleatória
String getRandomPhrase() {
  List<String> phrases = [
    "Hoje o céu está lindo e azul.",
    "A chuva torna o dia mais acolhedor.",
    "Aprender algo novo a cada dia é um privilégio.",
    "Conheci uma pessoa incrível hoje.",
    "Assisti a um filme emocionante ontem à noite.",
    "A música é a trilha sonora da minha vida.",
    "Fiz uma caminhada revigorante de manhã cedo.",
    "Concluí um projeto desafiador no trabalho.",
    "Compartilhei uma refeição deliciosa com amigos.",
    "A leitura de um bom livro é uma viagem para outro mundo.",
    "Conversar com a família sempre aquece o coração.",
    "Hoje é o primeiro dia do resto da sua vida.",
    "Aprendi algo novo no curso online que estou fazendo.",
    "Assisti a um pôr do sol deslumbrante no parque.",
    "Realizei uma boa ação ajudando alguém necessitado.",
    "O café da manhã é a refeição mais importante do dia.",
    "A vida é uma jornada cheia de surpresas.",
    "O sorriso de uma criança é contagiante.",
    "A gratidão é a chave para a felicidade.",
    "O amor e a amizade são tesouros preciosos."
  ];

  Random rng = Random();
  return phrases[rng.nextInt(phrases.length - 1)];
}
