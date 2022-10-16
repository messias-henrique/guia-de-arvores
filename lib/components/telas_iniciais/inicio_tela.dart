// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../telas_secundarias/especies/especies_tela.dart';
import '../telas_secundarias/especies/familias_tela.dart';
import '../telas_secundarias/especies/ordens_tela.dart';

Color _azul = Color.fromRGBO(55, 71, 79, 1);
Color _verde = Color.fromRGBO(194, 213, 155, 1);

final List<String> nameCards = [
  "Espécies",
  "Famílias",
  "Ordens",
];

class InicioTela extends StatefulWidget {
  const InicioTela({Key? key}) : super(key: key);

  @override
  State<InicioTela> createState() => _InicioTelaState();
}

class _InicioTelaState extends State<InicioTela> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 2) - 100,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Guia didático de árvores",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: _azul,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "do Parque Zoobotânico de Teresina",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _azul,
                      ),
                    ),
                    Text(
                      "(Versão TCC)",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _azul,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Center(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Widget func = Container();
                  func = (index == 0)
                      ? EspeciesTela()
                      : (index == 1)
                          ? FamiliasTela()
                          : func = OrdensTela();
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 5, top: 2.0, bottom: 10.0),
                    child: Card(
                      elevation: 5,
                      shadowColor: Color.fromRGBO(55, 71, 79, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      color: Theme.of(context).colorScheme.primary,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          (context),
                          // MaterialPageRoute(builder: (context) => func)),
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    func,
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(0.0, 1.0);
                              const end = Offset.zero;
                              const curve = Curves.ease;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: _verde,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "  " + nameCards[index],
                                  style: TextStyle(
                                    color: _azul,
                                    //fontFamily: 'Montserrat',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  color: Color.fromRGBO(55, 71, 79, 1),
                                  height: 1,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
