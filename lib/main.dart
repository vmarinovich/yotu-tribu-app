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
                return GridView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: posts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 50.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      Map post = snapshot.data[index];

                      return GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(PostSignal.routeName, arguments: post),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                FadeInImage(
                                    width: 70.0,
                                    height: 70.0,
                                    placeholder: AssetImage(
                                        'assets/imagenes/loading.gif'),
                                    image: NetworkImage(post['acf']['imagen']
                                        ['sizes']['thumbnail'])),
                                Text(post['name'],
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                                Text(post['acf']['fechas'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12.0))
                              ]));
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
