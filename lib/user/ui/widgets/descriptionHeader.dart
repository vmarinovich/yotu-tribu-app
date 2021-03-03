import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String pathImage = "assets/imagenes/logoPositivo.png";

class DescriptionHeaders extends StatelessWidget {
  final iconSign = Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
      ),
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: AlignmentDirectional.centerEnd,
              fit: BoxFit.fill,
              image: AssetImage(pathImage))));

  final textLogo = Column(children: <Widget>[
    Container(
        margin: EdgeInsets.only(
          top: 25.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Text(
          "YoTu Tribu",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ))
  ]);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      iconSign,
      textLogo,
    ]);
  }
}
