import 'package:flutter/material.dart';
import 'package:yotu_tribu_app/user/ui/widgets/backgroundHeader.dart';
import 'package:yotu_tribu_app/user/ui/widgets/dailyPost.dart';

class PostSignal extends StatefulWidget {
  const PostSignal({Key key}) : super(key: key);

  static const routeName = 'detalles';

  @override
  _PostSignalState createState() => _PostSignalState();
}

class _PostSignalState extends State<PostSignal> {
  @override
  Widget build(BuildContext context) {
    Map post = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
        appBar: AppBar(
          title: Text(post['name']),
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[DailyPost()],
            ),
            GradientBackground()
          ],
        ));
  }
}
