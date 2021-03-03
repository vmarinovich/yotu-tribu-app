import 'package:flutter/material.dart';

import 'descriptionHeader.dart';

// ignore: must_be_immutable
class GradientBackground extends StatelessWidget {
  String title = "Popular";

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250.0,
        width: 400.0,
        decoration: BoxDecoration(
            gradient: RadialGradient(
          center: const Alignment(0.0, 0.0), // near the top right
          radius: 2.5,
          colors: [
            const Color(0xFF2e2c65), // yellow sun
            const Color(0xFF082e4b), // blue sky
          ],
          stops: [0.0, 1.0],
        )),
        padding: EdgeInsets.only(
          top: 50.0,
          left: 0.0,
        ),
        child: Column(
          children: <Widget>[DescriptionHeaders()],
        ));
  }
}
