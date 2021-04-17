class Localizacao {
  int id;
  String descricao;

  Localizacao({
    this.id,
    this.descricao,
  });

  factory Localizacao.fromJson(Map<String, dynamic> json) {
    return Localizacao(
      id: json['id'],
      descricao: json['descricao'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['descricao'] = this.descricao;

    return data;
  }
}
