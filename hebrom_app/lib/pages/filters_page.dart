import 'package:intl/intl.dart';
import 'package:date_field/date_field.dart';
import 'package:hebrom_app/service/evento_service.dart' as EventService;
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/material.dart';

class FiltersPage extends StatefulWidget {
  FiltersPage({Key key}) : super(key: key);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      final successEntidades = (list) {
        list.forEach((x) => {
              itemsEntidade.add(DropdownMenuItem(
                child: Text(x.nomeFantasia),
                value: x.id,
              ))
            });
      };

      EventService.getEntidades(
          'entidadeService/adquirirTodos', successEntidades);

      final successLocalizacao = (list) {
        list.forEach((x) => {
              itemsLocalizacao.add(DropdownMenuItem(
                child: Text(x.descricao),
                value: x.id,
              ))
            });
      };

      EventService.getLocalizacao(
          'localizacaoService/adquirirTodos', successLocalizacao);
    });
  }

  DateTime dateInicio;
  DateTime dateFim;
  List<int> selectedItemsEntidades = [];
  List<int> selectedItemsLocalizacao = [];

  final List<DropdownMenuItem> itemsLocalizacao = [];
  final List<DropdownMenuItem> itemsEntidade = [];

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
                    selectedItemsEntidades = value;
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
                    });
                  },
                  selectedDate: dateFim,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    enabledBorder: InputBorder.none,
                  ),
                )),
            RaisedButton(
                color: Colors.greenAccent[700],
                textColor: Colors.white,
                onPressed: () {},
                child: Text("Aplicar Filtros")),
          ],
        )));
  }
}
