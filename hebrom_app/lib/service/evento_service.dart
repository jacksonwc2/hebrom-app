import 'dart:convert';
import 'package:hebrom_app/dto/Categoria.dart';
import 'package:hebrom_app/dto/Entidade.dart';
import 'package:hebrom_app/dto/Evento.dart';
import 'package:hebrom_app/dto/Localizacao.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

const BASE_URL = "http://192.168.0.127:8080/";
const HEADERS = {'Content-type': 'application/json'};
const STATUS_CODE_SUCESS = 200;
const IMAGEM_SERVICE = "fileService/files/";
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Future<List<Evento>> getEvento(
    String url, String pesquisa, int categoria) async {
  final SharedPreferences prefs = await _prefs;

  Map<String, String> queryParameters = {};

  if (pesquisa != null && pesquisa != "") {
    queryParameters["pesquisa"] = pesquisa;
  }

  if (prefs.getString('entidades') != null) {
    queryParameters["entidades"] = prefs.getString('entidades');
  }

  if (prefs.getString('localizacoes') != null) {
    queryParameters["localizacoes"] = prefs.getString('localizacoes');
  }

  if (prefs.getString('dataInicio') != null) {
    queryParameters["dataInicio"] = prefs.getString('dataInicio');
  }

  if (prefs.getString('dataFim') != null) {
    queryParameters["dataFim"] = prefs.getString('dataFim');
  }

  if (categoria != null) {
    queryParameters["categoria"] = categoria.toString();
  }

  var uri = Uri(queryParameters: queryParameters).query;

  if (uri != null && uri != "") {
    uri = "?" + uri;
  }

  http.Response response =
      await http.get(BASE_URL + url + uri, headers: HEADERS);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    var body = json.decode(utf8.decode(response.bodyBytes));
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

  if (response.statusCode == STATUS_CODE_SUCESS) {
    var body = json.decode(utf8.decode(response.bodyBytes));
    List<Categoria> retorno = body.map<Categoria>((map) {
      return Categoria.fromJson(map);
    }).toList();

    return retorno;
  }
}

Future<List<Entidade>> getEntidades(url, successEntidades) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    var body = json.decode(utf8.decode(response.bodyBytes));
    List<Entidade> retorno = body.map<Entidade>((map) {
      return Entidade.fromJson(map);
    }).toList();

    successEntidades(retorno);

    return retorno;
  }
}

Future<List<Localizacao>> getLocalizacao(url, successLocalizacao) async {
  http.Response response = await http.get(BASE_URL + url, headers: HEADERS);

  if (response.statusCode == STATUS_CODE_SUCESS) {
    var body = json.decode(utf8.decode(response.bodyBytes));
    List<Localizacao> retorno = body.map<Localizacao>((map) {
      return Localizacao.fromJson(map);
    }).toList();

    successLocalizacao(retorno);

    return retorno;
  }
}
