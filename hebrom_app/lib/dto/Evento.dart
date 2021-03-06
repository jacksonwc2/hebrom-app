class Evento {
  int id;
  int codigoCategoria;
  int codigoEntidade;
  int codigoLocalizacao;
  String dataInicio;
  String dataFinal;
  String titulo;
  String descricao;
  String banner;
  String descricaoEntidade;
  String descricaoCategoria;
  String descricaoLocalizacao;
  String uriLocalizacao;
  String obsLocalizacao;

  Evento(
      {this.id,
      this.codigoCategoria,
      this.codigoEntidade,
      this.codigoLocalizacao,
      this.dataInicio,
      this.dataFinal,
      this.titulo,
      this.descricao,
      this.banner,
      this.descricaoEntidade,
      this.descricaoCategoria,
      this.descricaoLocalizacao,
      this.uriLocalizacao,
      this.obsLocalizacao});

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
        id: json['id'],
        codigoCategoria: json['codigoCategoria'],
        codigoEntidade: json['codigoEntidade'],
        codigoLocalizacao: json['codigoLocalizacao'],
        dataInicio: json['dataInicio'],
        dataFinal: json['dataFinal'],
        titulo: json['titulo'],
        descricao: json['descricao'],
        banner: json['banner'],
        descricaoEntidade: json['descricaoEntidade'],
        descricaoCategoria: json['descricaoCategoria'],
        descricaoLocalizacao: json['descricaoLocalizacao'],
        uriLocalizacao: json['uriLocalizacao'],
        obsLocalizacao: json['obsLocalizacao']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['codigoCategoria'] = this.codigoCategoria;
    data['codigoEntidade'] = this.codigoEntidade;
    data['codigoLocalizacao'] = this.codigoLocalizacao;
    data['dataInicio'] = this.dataInicio;
    data['dataFinal'] = this.dataFinal;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['banner'] = this.banner;
    data['descricaoEntidade'] = this.descricaoEntidade;
    data['descricaoCategoria'] = this.descricaoCategoria;
    data['descricaoLocalizacao'] = this.descricaoLocalizacao;
    data['uriLocalizacao'] = this.uriLocalizacao;
    data['obsLocalizacao'] = this.obsLocalizacao;

    return data;
  }
}
