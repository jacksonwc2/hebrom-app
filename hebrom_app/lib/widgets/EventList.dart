import 'package:flutter/material.dart';
import 'package:hebrom_app/Animation/FadeAnimation.dart';
import 'package:hebrom_app/dto/Evento.dart';
import 'package:hebrom_app/widgets/CardEvent.dart';

class EventList extends State {
  Widget lista(context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Text("CAREGANDO");
    }
    if (snapshot.hasData && !snapshot.data.isEmpty) {
      return renderizarEventos(snapshot.data);
    } else {
      return renderizarNaoHaDados();
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

        return GestureDetector(
          onTap: () {
            print('Hello');
          },
          child: cardEvent(
              image: evento.banner,
              titulo: evento.titulo,
              descricao: evento.descricao,
              codigoEntidade: evento.codigoEntidade),
        );
      },
      separatorBuilder: (context, index) => Container(
        height: 10,
      ),
      itemCount: data.length,
    );
  }

  Widget renderizarNaoHaDados() {
    return FadeAnimation(
      2,
      Text("Não há Dados."),
    );
  }
}
