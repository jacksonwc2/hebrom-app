import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';
import 'package:hebrom_app/service/evento_service.dart' as EventService;
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FiltersPage extends StatefulWidget {
  FiltersPage({Key key}) : super(key: key);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime dateInicio;
  DateTime dateFim;
  List<int> selectedItemsEntidades = [];
  List<int> selectedItemsLocalizacao = [];

  final List<DropdownMenuItem> itemsLocalizacao = [];
  final List<DropdownMenuItem> itemsEntidade = [];
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _setFilter(key, value) async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      prefs.setString(key, value.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    adquirirDados();
  }

  adquirirDados() async {
    final SharedPreferences prefs = await _prefs;

    final successEntidades = (list) {
      List<dynamic> values = [];

      if (prefs.getString('entidades') != null) {
        values = json.decode(prefs.getString('entidades'));
      }

      for (var x in list) {
        var item = DropdownMenuItem(
          child: Text(x.nomeFantasia),
          value: (x.id),
        );

        setState(() {
          itemsEntidade.add(item);
          //selectedItemsEntidades.add(values.indexOf(x.id));
        });
      }
    };

    final successLocalizacao = (list) {
      List<dynamic> values = [];
      if (prefs.getString('localizacoes') != null) {
        values = json.decode(prefs.getString('localizacoes'));
      }

      for (var x in list) {
        var item = DropdownMenuItem(
          child: Text(x.descricao),
          value: (x.id),
        );

        setState(() {
          itemsLocalizacao.add(item);
          //selectedItemsLocalizacao.add(values.indexOf(x.id));
        });
      }
    };

    setState(() {
      if (prefs.getString('dataFim') != null) {
        dateFim = DateTime.parse(prefs.getString('dataFim'));
      }

      if (prefs.getString('dataInicio') != null) {
        dateInicio = DateTime.parse(prefs.getString('dataInicio'));
      }
    });

    EventService.getEntidades(
        'entidadeService/adquirirTodos', successEntidades);

    EventService.getLocalizacao(
        'localizacaoService/adquirirTodos', successLocalizacao);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Container(
            child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                    child: Text('Entidades',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800])))),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]),
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(12)),
              child: SearchableDropdown.multiple(
                underline: SizedBox(),
                doneButton: 'Fechar',
                items: itemsEntidade,
                selectedItems: selectedItemsEntidades,
                hint: "Selecione",
                searchHint: "Selecione as Entidades",
                displayClearIcon: true,
                onChanged: (value) {
                  setState(() {
                    var itens = [];
                    for (var item in value) {
                      itens.add(itemsEntidade[item].value);
                    }

                    selectedItemsEntidades = value;
                    _setFilter("entidades", itens);
                  });
                },
                dialogBox: true,
                closeButton: (selectedItemsClose) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                          onPressed: () {
                            setState(() {
                              selectedItemsEntidades.clear();
                              selectedItemsEntidades.addAll(
                                  Iterable<int>.generate(itemsEntidade.length)
                                      .toList());
                            });
                          },
                          child: Text("Todos")),
                      RaisedButton(
                          onPressed: () {
                            setState(() {
                              selectedItemsEntidades.clear();
                            });
                          },
                          child: Text("Nenhum")),
                    ],
                  );
                },
                isExpanded: true,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                    child: Text('Localização',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800])))),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]),
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(12)),
              child: SearchableDropdown.multiple(
                underline: SizedBox(),
                doneButton: 'Fechar',
                items: itemsLocalizacao,
                selectedItems: selectedItemsLocalizacao,
                hint: "Selecione",
                searchHint: "Selecione as Localizações",
                displayClearIcon: true,
                onChanged: (value) {
                  setState(() {
                    selectedItemsLocalizacao = value;

                    var itens = [];
                    for (var item in value) {
                      itens.add(itemsLocalizacao[item].value);
                    }

                    _setFilter("localizacoes", itens);
                  });
                },
                dialogBox: true,
                closeButton: (selectedItemsClose) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                          onPressed: () {
                            setState(() {
                              selectedItemsLocalizacao.clear();
                              selectedItemsLocalizacao.addAll(
                                  Iterable<int>.generate(
                                          itemsLocalizacao.length)
                                      .toList());
                            });
                          },
                          child: Text("Todos")),
                      RaisedButton(
                          onPressed: () {
                            setState(() {
                              selectedItemsLocalizacao.clear();
                            });
                          },
                          child: Text("Nenhum")),
                    ],
                  );
                },
                isExpanded: true,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                    child: Text('Data Inicial',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800])))),
            Container(
                margin: EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]),
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(12)),
                child: DateField(
                  label: 'Selecione',
                  dateFormat: DateFormat('dd/MM/yyyy'),
                  onDateSelected: (DateTime value) {
                    setState(() {
                      dateInicio = value;
                      _setFilter("dataInicio", value);
                    });
                  },
                  selectedDate: dateInicio,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    enabledBorder: InputBorder.none,
                  ),
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                    child: Text('Data Final',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800])))),
            Container(
                margin: EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]),
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(12)),
                child: DateField(
                  label: 'Selecione',
                  dateFormat: DateFormat('dd/MM/yyyy'),
                  onDateSelected: (DateTime value) {
                    setState(() {
                      dateFim = value;
                      _setFilter("dataFim", value);
                    });
                  },
                  selectedDate: dateFim,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    enabledBorder: InputBorder.none,
                  ),
                )),
          ],
        )));
  }
}
