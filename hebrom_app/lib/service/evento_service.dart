import 'dart:convert';
import 'package:hebrom_app/dto/Categoria.dart';
import 'package:hebrom_app/dto/Entidade.dart';
import 'package:hebrom_app/dto/Evento.dart';
import 'package:hebrom_app/dto/Localizacao.dart';
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

  if (categoria != null && (pesquisa == null || pesquisa == "")) {
    url += "?";
  }

  if (categoria != null) {
    url += 'categoria=' + categoria.toString();
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

Future<List<Categoria>> getCategorias(url) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  var body = json.decode(response.body);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    List<Categoria> retorno = body.map<Categoria>((map) {
      return Categoria.fromJson(map);
    }).toList();

    return retorno;
  }
}

Future<List<Entidade>> getEntidades(url, successEntidades) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  var body = json.decode(response.body);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    List<Entidade> retorno = body.map<Entidade>((map) {
      return Entidade.fromJson(map);
    }).toList();

    successEntidades(retorno);

    return retorno;
  }
}

Future<List<Localizacao>> getLocalizacao(url, successLocalizacao) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  var body = json.decode(response.body);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    List<Localizacao> retorno = body.map<Localizacao>((map) {
      return Localizacao.fromJson(map);
    }).toList();

    successLocalizacao(retorno);

    return retorno;
  }
}
