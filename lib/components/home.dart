// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'telas_iniciais/inicio_tela.dart';
import 'telas_iniciais/localizacao_tela.dart';
import 'telas_iniciais/info_tela.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const Home());
}

final telas = [
  InicioTela(),
  LocalizacaoTela(),
  InformacaoTela(),
];

int _page = 0;
GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
Color _verde = Color.fromRGBO(194, 213, 155, 1);
Color _azul = Color.fromRGBO(55, 71, 79, 1);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // This widget is the root of your application.
  Widget bodyFunction(index) {
    return telas[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (_page == 1)
            ? Text(
                "Localização",
                style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
              )
            : (_page == 2)
                ? Text(
                    "Informações",
                    style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
                  )
                : Text(
                    "",
                    style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
                  ),
        backgroundColor: const Color.fromRGBO(194, 213, 155, 1),
      ),
      body: bodyFunction(_page),
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(milliseconds: 400),
        color: _verde,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        key: _bottomNavigationKey,
        items: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.home,
              color: _azul,
              size: 40,
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.location_on,
              color: _azul,
              size: 40,
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.announcement,
              color: _azul,
              size: 40,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
