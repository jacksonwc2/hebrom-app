import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hebrom_app/Debouncer.dart';
import 'Animation/FadeAnimation.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:date_field/date_field.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(HebromApp());
}

class HebromApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HebromApp',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.light, primaryColor: Colors.white),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pesquisa = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _debouncer = Debouncer(milliseconds: 500);

  DateTime selectedData;

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
              height: 32,
            )
          ],
        ),
        elevation: 0,
        bottomOpacity: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 22,
                  color: Colors.black54,
                ),
              )),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      color: Colors.white,
                      height: 35,
                      child: Container(
                        padding: EdgeInsets.all(0),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12)),
                        child: TextFormField(
                          controller: _pesquisa,
                          onChanged: (text) => {
                            _debouncer.run(() {
                              showDialog(
                                  context: _scaffoldKey.currentState.context,
                                  builder: (BuildContext dialogContext) {
                                    return AlertDialog(
                                      title: Text('Opa'),
                                      content: Text(text + _pesquisa.text),
                                    );
                                  });
                            })
                          },
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black54,
                              ),
                              hintText: 'Pesquisar...'),
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    color: Colors.white,
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 3.5 / 1,
                          child: FadeAnimation(
                              1,
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    "Categorias",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )),
                        ),
                        AspectRatio(
                          aspectRatio: 3.5 / 1,
                          child: FadeAnimation(
                              1,
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    "Categorias",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )),
                        ),
                        AspectRatio(
                          aspectRatio: 3.5 / 1,
                          child: FadeAnimation(
                              1,
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    "Categorias",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )),
                        ),
                        AspectRatio(
                          aspectRatio: 3.5 / 1,
                          child: FadeAnimation(
                              1,
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    "Categorias",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )),
                        ),
                        AspectRatio(
                          aspectRatio: 3.5 / 1,
                          child: FadeAnimation(
                              1,
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    "Categorias",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )),
                        ),
                        AspectRatio(
                          aspectRatio: 3.5 / 1,
                          child: FadeAnimation(
                              1,
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    "Categorias",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              Image.asset('assets/banner.jpg'),
                              ListTile(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Nome da Entidade',
                                          style: TextStyle(fontSize: 10)),
                                      Text('Título do Evento',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                  subtitle: Text(
                                    'Descrição do Evento Descrição do Evento Descrição do Evento  Descrição do Evento ',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: Icon(Icons.chevron_right)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
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
              )))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            label: 'Eventos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tune),
            label: 'Filtros',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black87,
        iconSize: 20,
        elevation: 0,
        onTap: _onItemTapped,
      ),
    );
  }
}
