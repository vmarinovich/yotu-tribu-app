import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user/repository/api/wordpresApi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Yotu Tribu App'),
        ),
        body: FutureBuilder(
            future: post(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var posts = snapshot.data;
                return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      Map post = snapshot.data[index];
                      return Text('Texto repetitivo');
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
