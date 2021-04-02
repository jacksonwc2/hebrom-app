import 'package:flutter/material.dart';
import 'package:hebrom_app/Animation/FadeAnimation.dart';
import 'package:hebrom_app/dto/Evento.dart';
import 'package:hebrom_app/widgets/CardEvent.dart';

class EventList extends State {
  Widget lista(context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Text("Carregando...");
    }

    if (snapshot.hasData && !snapshot.data.isEmpty) {
      return renderizarEventos(snapshot.data);
    } else {
      return FadeAnimation(
        2,
        Text("Não há Dados."),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget renderizarEventos(data) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        Evento evento = data[index];
        return cardEvent(evento, context);
      },
      separatorBuilder: (context, index) => Container(
        height: 10,
      ),
      itemCount: data.length,
    );
  }
}
