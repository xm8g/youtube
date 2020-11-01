import 'package:flutter/material.dart';
import 'package:youtube/search/custom_search_delegate.dart';
import 'package:youtube/telas/biblioteca.dart';
import 'package:youtube/telas/em_alta.dart';
import 'package:youtube/telas/inicio.dart';
import 'package:youtube/telas/inscricao.dart';

void main() {
  runApp(Youtube());
}

class Youtube extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndexBottomOptions = 0;
  String _textoPesquisa = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(pesquisa: _textoPesquisa),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        title: Image.asset('images/youtube.png', width: 98, height: 22),
        actions: [
          /*
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {

            },
          ),*/
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String arg = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _textoPesquisa = arg;
              });
            },
          ),
          /*
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {

            },
          )*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_currentIndexBottomOptions],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndexBottomOptions,
        onTap: (index) {
          setState(() {
            _currentIndexBottomOptions = index;
          });
        },
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Início")),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), title: Text("Em alta")),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions), title: Text("Inscrições")),
          BottomNavigationBarItem(icon: Icon(Icons.folder), title: Text("Biblioteca")),
        ],
      ),
    );
  }
}
