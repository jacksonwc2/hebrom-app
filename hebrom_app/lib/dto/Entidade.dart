class Entidade {
  int id;
  String nomeFantasia;

  Entidade({
    this.id,
    this.nomeFantasia,
  });

  factory Entidade.fromJson(Map<String, dynamic> json) {
    return Entidade(
      id: json['id'],
      nomeFantasia: json['nomeFantasia'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['nomeFantasia'] = this.nomeFantasia;

    return data;
  }
}
