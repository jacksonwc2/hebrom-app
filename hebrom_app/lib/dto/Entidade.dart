class Entidade {
  int id;
  String nomeFantasia;
  String documento;

  Entidade({this.id, this.nomeFantasia, this.documento});

  factory Entidade.fromJson(Map<String, dynamic> json) {
    return Entidade(
      id: json['id'],
      nomeFantasia: json['nomeFantasia'],
      documento: json['documento'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['nomeFantasia'] = this.nomeFantasia;
    data['documento'] = this.documento;

    return data;
  }
}
