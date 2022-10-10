import 'dart:convert';

ListaContrato listaContratoFromJson(String str) =>
    ListaContrato.fromJson(json.decode(str));

String listaContratoToJson(ListaContrato data) => json.encode(data.toJson());

class ListaContrato {
  ListaContrato({
   required this.itens,
  });

  List<Iten> itens;

  factory ListaContrato.fromJson(Map<String, dynamic> json) => ListaContrato(
        itens: List<Iten>.from(json["itens"].map((x) => Iten.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "itens": List<dynamic>.from(itens.map((x) => x.toJson())),
      };
}

class Iten {
  Iten({
    required this.id,
    required this.numeroContrato,
    required this.tipoContrato,
    required this.objeto,
    required this.situacao,
    required this.valorInvestimento,
    required this.valorInvestimentoExtenso,
    required this.gestor,
    required this.empresa,
    required this.prazoExecucao,
    required this.prazoVigencia,
    required this.diretoria,
  });

  int id;
  String numeroContrato;
  String tipoContrato;
  String objeto;
  String situacao;
  double valorInvestimento;
  String valorInvestimentoExtenso;
  String gestor;
  String empresa;
  String prazoExecucao;
  String prazoVigencia;
  String diretoria;

  factory Iten.fromJson(Map<String, dynamic> json) => Iten(
        id: json["id"],
        numeroContrato: json["numeroContrato"],
        tipoContrato: json["tipoContrato"],
        objeto: json["objeto"],
        situacao: json["situacao"],
        valorInvestimento: json["valorInvestimento"].toDouble(),
        valorInvestimentoExtenso: json["valorInvestimentoExtenso"],
        gestor: json["gestor"],
        empresa: json["empresa"],
        prazoExecucao: json["prazoExecucao"],
        prazoVigencia: json["prazoVigencia"],
        diretoria: json["diretoria"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "numeroContrato": numeroContrato,
        "tipoContrato": tipoContrato,
        "objeto": objeto,
        "situacao": situacao,
        "valorInvestimento": valorInvestimento,
        "valorInvestimentoExtenso": valorInvestimentoExtenso,
        "gestor": gestor,
        "empresa": empresa,
        "prazoExecucao": prazoExecucao,
        "prazoVigencia": prazoVigencia,
        "diretoria": diretoria,
      };
}
