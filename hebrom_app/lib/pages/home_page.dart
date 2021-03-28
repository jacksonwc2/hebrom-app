import 'package:date_field/date_field.dart';
import 'package:hebrom_app/Debouncer.dart';
import 'package:hebrom_app/pages/events_page.dart';
import 'package:hebrom_app/pages/filters_page.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/material.dart';

import '../animation/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        children: <Widget>[EventsPage(), FiltersPage()],
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
