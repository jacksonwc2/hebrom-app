import 'package:date_field/date_field.dart';
import 'package:hebrom_app/Debouncer.dart';
import 'package:hebrom_app/pages/events_page.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/material.dart';

class FiltersPage extends StatefulWidget {
  FiltersPage({Key key}) : super(key: key);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime selectedData;
  List<int> selectedItems = [1];

  final List<DropdownMenuItem> items = [
    DropdownMenuItem(
      child: Text('Categoria 1'),
      value: 'Categoria 1',
    ),
    DropdownMenuItem(
      child: Text('Categoria 2'),
      value: 'Categoria 2',
    ),
    DropdownMenuItem(
      child: Text('Categoria 3'),
      value: 'Categoria 3',
    )
  ];

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
                items: items,
                selectedItems: selectedItems,
                hint: "Selecione",
                searchHint: "Selecione as Categorias",
                displayClearIcon: true,
                onChanged: (value) {
                  setState(() {
                    selectedItems = value;
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
                              selectedItems.clear();
                              selectedItems.addAll(
                                  Iterable<int>.generate(items.length)
                                      .toList());
                            });
                          },
                          child: Text("Todos")),
                      RaisedButton(
                          onPressed: () {
                            setState(() {
                              selectedItems.clear();
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
                items: items,
                selectedItems: selectedItems,
                hint: "Selecione",
                searchHint: "Selecione as Categorias",
                displayClearIcon: true,
                onChanged: (value) {
                  setState(() {
                    selectedItems = value;
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
                              selectedItems.clear();
                              selectedItems.addAll(
                                  Iterable<int>.generate(items.length)
                                      .toList());
                            });
                          },
                          child: Text("Todos")),
                      RaisedButton(
                          onPressed: () {
                            setState(() {
                              selectedItems.clear();
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
