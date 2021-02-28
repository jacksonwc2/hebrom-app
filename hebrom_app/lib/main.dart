import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Animation/FadeAnimation.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HebromApp',
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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
  ];

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  color: Colors.white,
                  height: 35,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    decoration: new BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: new BorderRadius.circular(12)),
                    child: new TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          icon: Icon(Icons.search),
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
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
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
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
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
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
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
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
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
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
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
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
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
            ],
          ),
        ),
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
