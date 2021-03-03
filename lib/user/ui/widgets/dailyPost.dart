import 'package:flutter/material.dart';

class DailyPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map post = ModalRoute.of(context).settings.arguments as Map;

    final iconSign = Container(
        margin: EdgeInsets.only(
          top: 230.0,
          left: 0.0,
        ),
        width: 120.0,
        height: 150.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(post['acf']['imagen']['url']))));

    final titleSign = Container(
        margin: EdgeInsets.only(
          top: 0.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Text(
          post['name'],
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.0,
            fontWeight: FontWeight.w700,
          ),
        ));

    final textDescription = Container(
        margin: EdgeInsets.only(
          top: 20.0,
          left: 25.0,
          right: 25.0,
        ),
        child: Text(
          post['description'],
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ));
    return Column(children: <Widget>[
      iconSign,
      titleSign,
      textDescription,
    ]);
  }
}
