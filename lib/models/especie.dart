class Especie {
  String? bibliografia;
  String? caracteristicas;
  String? classe;
  String? divisao;
  String? familia;
  String? informacoes;
  String? link;
  String? nome;
  String? nomeCientifico;
  String? nomeCientificoItalico;
  String? nomesPopulares;
  String? ocorrencia;
  String? ordem;
  String? utilidades;

  Especie({
    required this.bibliografia,
    required this.caracteristicas,
    required this.classe,
    required this.divisao,
    required this.familia,
    required this.informacoes,
    required this.link,
    required this.nome,
    required this.nomeCientifico,
    required this.nomeCientificoItalico,
    required this.nomesPopulares,
    required this.ocorrencia,
    required this.ordem,
    required this.utilidades,
  });

  Especie.fromMap(dynamic obj) {
    // obj[''];
    bibliografia = obj['bibliografia'];
    caracteristicas = obj['caracteristicas'];
    classe = obj['classe'];
    divisao = obj['divisao'];
    familia = obj['familia'];
    informacoes = obj['informacoes'];
    link = obj['link'];
    nome = obj['nome'];
    nomeCientifico = obj['nome_cientifico'];
    nomeCientificoItalico = obj['nome_cientifico_italico'];
    nomesPopulares = obj['nomes-populares'];
    ocorrencia = obj['ocorrencia'];
    ordem = obj['ordem'];
    utilidades = obj['utilidades'];
  }
}
