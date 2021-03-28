import 'package:flutter/material.dart';

Widget cardEvent({image, titulo, descricao, codigoEntidade}) {
  return Row(
    children: <Widget>[
      Card(
        child: Column(
          children: [
            Image.asset('assets/banner.jpg'),
            ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(codigoEntidade.toString(),
                        style: TextStyle(fontSize: 10)),
                    Text(titulo, style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
                subtitle: Text(
                  descricao,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(Icons.chevron_right)),
          ],
        ),
      )
    ],
  );
}
