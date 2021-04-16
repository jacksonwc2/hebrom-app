import 'package:date_field/date_field.dart';
import 'package:hebrom_app/Debouncer.dart';
import 'package:hebrom_app/dto/Categoria.dart';
import 'package:hebrom_app/dto/Evento.dart';
import 'package:hebrom_app/widgets/EventList.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:hebrom_app/service/evento_service.dart' as EventService;

import '../animation/FadeAnimation.dart';

class EventsPage extends StatefulWidget {
  EventsPage({Key key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  int categoriaId = null;
  final _pesquisa = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);
  Future<List<Evento>> eventos;
  Future<List<Categoria>> categorias;
  List _selectedIndexs = [];

  @override
  void initState() {
    super.initState();
    getEventos(null, null);
    getCategorias();
  }

  callback(id) {
    setState(() {
      categoriaId = id;
      getEventos(_pesquisa.text, id);
    });
  }

  getEventos(String pesquisa, int categoria) async {
    setState(() {
      eventos = EventService.getEvento(
          'eventoService/adquirirTodos', pesquisa, categoria);
    });
  }

  getCategorias() async {
    setState(() {
      categorias = EventService.getCategorias('categoriaService/adquirirTodos');
    });
  }

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
                      getEventos(text, categoriaId);
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
          FutureBuilder(
            future: categorias,
            builder: (context, snapshot) {
              return Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  color: Colors.white,
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final data = snapshot.data;
                      final _isSelected = _selectedIndexs.contains(index);
                      Categoria categoria = data[index];
                      return InkWell(
                          onTap: () {
                            setState(() {
                              if (_isSelected) {
                                _selectedIndexs = [];
                                callback(null);
                              } else {
                                _selectedIndexs = [];
                                _selectedIndexs.add(index);
                                callback(categoria.id);
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color:
                                    _isSelected ? Colors.black87 : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1,
                                    color: _isSelected
                                        ? Colors.black87
                                        : Colors.black)),
                            child: Center(
                              child: Text(
                                categoria.descricao,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: _isSelected
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ));
                    },
                    itemCount: snapshot.data.length,
                  ));
            },
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: FutureBuilder(
              future: eventos,
              builder: (context, snapshort) {
                return EventList().lista(context, snapshort);
              },
            ),
          ),
        ],
      ),
    ));
  }
}
