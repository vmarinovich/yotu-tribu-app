import 'package:flutter/material.dart';
import 'package:yotu_tribu_app/main.dart';
import 'package:yotu_tribu_app/user/ui/screens/categorias.dart';
import 'package:yotu_tribu_app/user/ui/widgets/backgroundHeader.dart';

menu(context) {
  return Drawer(
      child: ListView(
    children: <Widget>[
      GradientBackground(),
      Column(
        children: <Widget>[
          ListTile(
            title: Text('Inicio'),
            leading: Icon(Icons.home),
            onTap: () => Navigator.pushNamed(context, HomePage.routeName),
          ),
          ListTile(
            title: Text('Categorias'),
            leading: Icon(Icons.list),
            onTap: () => Navigator.pushNamed(context, Categorias.routeName),
          ),
          ListTile(
            title: Text('Lectura diaria'),
            leading: Icon(Icons.book),
          ),
          ListTile(
            title: Text('Acceso premium'),
            leading: Icon(Icons.dynamic_form),
          )
        ],
      )
    ],
  ));
}
