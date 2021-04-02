import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hebrom_app/dto/Evento.dart';
import 'package:hebrom_app/service/evento_service.dart' as EventService;

class EventsDetailPage extends StatefulWidget {
  EventsDetailPage({Key key, this.evento}) : super(key: key);

  final Evento evento;

  @override
  _EventsDetailPageState createState() => _EventsDetailPageState();
}

class _EventsDetailPageState extends State<EventsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Column(
        children: [
          Image.network(EventService.getUriBanner(widget.evento.banner)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
                width: 2,
              ),
            ),
            child: Text(widget.evento.titulo),
          ),
          Text(widget.evento.descricao),
          Text(widget.evento.descricaoEntidade),
        ],
      ),
    )));
  }
}
