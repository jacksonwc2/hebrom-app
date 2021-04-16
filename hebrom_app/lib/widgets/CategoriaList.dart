import 'package:flutter/material.dart';
import 'package:hebrom_app/Animation/FadeAnimation.dart';
import 'package:hebrom_app/dto/Categoria.dart';
import 'package:hebrom_app/widgets/CardEvent.dart';

class CategoriaList extends State {
  Widget lista(context, snapshot, callback) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Text("Carregando...");
    }

    if (snapshot.hasData && !snapshot.data.isEmpty) {
      return renderizarEventos(snapshot.data, callback);
    } else {
      return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget renderizarEventos(data, callback) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
        color: Colors.white,
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Categoria categoria = data[index];
            bool isClicked = false;
            return InkWell(
                onTap: () => callback(categoria.id),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 1,
                          color: isClicked ? Colors.red : Colors.grey)),
                  child: Center(
                    child: Text(
                      categoria.descricao,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ));
          },
          separatorBuilder: (context, index) => Container(
            width: 1,
          ),
          itemCount: data.length,
        ));
  }
}
