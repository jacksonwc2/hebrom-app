import 'dart:convert';
import 'package:hebrom_app/dto/Evento.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

const BASE_URL = "http://192.168.1.102:8080/";
const HEADERS = {'Content-type': 'application/json'};
const STATUS_CODE_SUCESS = 200;
const IMAGEM_SERVICE = "fileService/files/";

Future<List<Evento>> getEvento(
    String url, String pesquisa, int categoria) async {
  if (pesquisa != null && pesquisa != "") {
    url += '?pesquisa=' + pesquisa;

    if (categoria != null) {
      url += "&";
    }
  }

  if (categoria != null) {
    url += '?categoria=' + categoria.toString();
  }

  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  var body = json.decode(response.body);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    List<Evento> retorno = body.map<Evento>((map) {
      return Evento.fromJson(map);
    }).toList();

    return retorno;
  }
}

String getUriBanner(String fileName) {
  return BASE_URL + IMAGEM_SERVICE + fileName;
}
