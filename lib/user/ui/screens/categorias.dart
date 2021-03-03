import 'package:flutter/material.dart';
import 'package:yotu_tribu_app/user/ui/widgets/menuSidebar.dart';

class Categorias extends StatelessWidget {
  const Categorias({Key key}) : super(key: key);
  static const routeName = 'paginaCategorias';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menu(context),
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Text('Aqui estoy)'),
          )
        ],
      ),
    );
  }
}
