import 'package:flutter/material.dart';
import 'package:yotu_tribu_app/user/ui/screens/categorias.dart';
import 'package:yotu_tribu_app/user/ui/screens/postSiganl.dart';
import 'package:yotu_tribu_app/user/ui/widgets/menuSidebar.dart';
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
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (BuildContext contex) => HomePage(),
        PostSignal.routeName: (BuildContext context) => PostSignal(),
        Categorias.routeName: (BuildContext context) => Categorias(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: menu(context),
        appBar: AppBar(
          title: Text('Yotu Tribu App'),
        ),
        body: FutureBuilder(
            future: post(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var posts = snapshot.data;
                return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      Map post = snapshot.data[index];

                      return GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(PostSignal.routeName, arguments: post),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                FadeInImage(
                                    placeholder:
                                        AssetImage('assets/loading.gif'),
                                    image: NetworkImage(post['acf']['imagen']
                                        ['sizes']['thumbnail'])),
                                Text(post['name'],
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold)),
                                Text(post['acf']['fechas'])
                              ]));
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
