import 'package:flutter/material.dart';
import 'package:hebrom_app/dto/Evento.dart';
import 'package:url_launcher/url_launcher.dart';
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
              decoration: new BoxDecoration(color: Colors.grey[200]),
              child: ListTile(
                  title: Text(widget.evento.titulo,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.favorite_border))),
          Container(
              decoration: new BoxDecoration(
                  border: Border.all(color: Colors.grey[200])),
              child: ListTile(
                  title: Text('Entidade', style: TextStyle(fontSize: 10)),
                  subtitle: Text(widget.evento.descricaoEntidade,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.home_work))),
          Container(
              decoration: new BoxDecoration(
                  border: Border.all(color: Colors.grey[200])),
              child: ListTile(
                  title: Text('Categoria', style: TextStyle(fontSize: 10)),
                  subtitle: Text(widget.evento.descricaoCategoria,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.local_offer))),
          Container(
              decoration: new BoxDecoration(
                  border: Border.all(color: Colors.grey[200])),
              child: ListTile(
                  title: Text('Início', style: TextStyle(fontSize: 10)),
                  subtitle: Text(widget.evento.dataInicio,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.calendar_today))),
          widget.evento.dataFinal != null
              ? Container(
                  decoration: new BoxDecoration(
                      border: Border.all(color: Colors.grey[200])),
                  child: ListTile(
                      title: Text('Final', style: TextStyle(fontSize: 10)),
                      subtitle: Text(widget.evento.dataFinal,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.calendar_today)))
              : Container(),
          InkWell(
              onTap: () async {
                await launch(widget.evento.uriLocalizacao);
              },
              child: Container(
                  decoration: new BoxDecoration(
                      border: Border.all(color: Colors.grey[200])),
                  child: ListTile(
                      title: Text(widget.evento.descricaoLocalizacao,
                          style: TextStyle(fontSize: 10)),
                      subtitle: Text(widget.evento.obsLocalizacao,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.place)))),
          widget.evento.descricao != null
              ? Container(
                  child: ListTile(
                  title: Text('Sobre o Evento',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(widget.evento.descricao),
                ))
              : Container()
        ],
      ),
    )));
  }
}
