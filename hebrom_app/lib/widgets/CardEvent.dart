import 'package:flutter/material.dart';
import 'package:hebrom_app/dto/Evento.dart';
import 'package:hebrom_app/pages/events_detail_page.dart';
import 'package:hebrom_app/service/evento_service.dart' as EventService;

Widget cardEvent(Evento evento, context) {
  return Card(
    child: InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => EventsDetailPage(
            evento: evento,
          ),
          fullscreenDialog: true,
        ),
      ),
      child: Column(
        children: [
          Image.network(EventService.getUriBanner(evento.banner)),
          ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(evento.descricaoEntidade,
                      style: TextStyle(fontSize: 10)),
                  Text(evento.titulo,
                      style: TextStyle(fontWeight: FontWeight.w500))
                ],
              ),
              subtitle: Text(
                evento.descricao != null ? evento.descricao : "",
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(Icons.chevron_right)),
        ],
      ),
    ),
  );
}
