import 'package:date_field/date_field.dart';
import 'package:hebrom_app/Debouncer.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/material.dart';

import '../animation/FadeAnimation.dart';

class EventsPage extends StatefulWidget {
  EventsPage({Key key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final _pesquisa = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                            border: Border.all(width: 1, color: Colors.grey)),
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
                            border: Border.all(width: 1, color: Colors.grey)),
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
                            border: Border.all(width: 1, color: Colors.grey)),
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
                            border: Border.all(width: 1, color: Colors.grey)),
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
                            border: Border.all(width: 1, color: Colors.grey)),
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
                            border: Border.all(width: 1, color: Colors.grey)),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nome da Entidade',
                                  style: TextStyle(fontSize: 10)),
                              Text('Título do Evento',
                                  style: TextStyle(fontWeight: FontWeight.w500))
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
    ));
  }
}
