import 'package:hebrom_app/pages/events_page.dart';
import 'package:hebrom_app/pages/filters_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          _selectedIndex == 1 ?
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                child: InkWell(
                  onTap: ()  {
                   setState(() {
                     _selectedIndex = 0;
                   });
                  },
                  child:  Row(
                    children: [
                      Text('Aplicar filtros', style: TextStyle(fontSize: 10, color:Colors.black ),),
                      SizedBox(width: 5),
                      Icon(
                        Icons.check_circle_outline,
                        size: 20,
                        color: Colors.green,
                      ),
                    ],
                  ),
                )
              )) :   Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                  child:
                        Icon(
                          Icons.info_outline_rounded,
                          size: 20,
                          color: Colors.grey,
                        ),
                    ),
                  )
        ],
      ),
      body: _selectedIndex == 0 ? EventsPage() : FiltersPage(),
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
