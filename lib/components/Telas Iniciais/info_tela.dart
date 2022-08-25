// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guia/components/Telas%20Secundarias/dicionarioBotanicoTela.dart';
import 'package:guia/components/Telas%20Secundarias/sobreTela.dart';

final _verde = Color.fromRGBO(194, 213, 155, 1);
final _azul = Color.fromRGBO(55, 71, 79, 1);

class InfoTela extends StatelessWidget {
  const InfoTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(left: 8, right: 8),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Card(
                  elevation: 10,
                  shadowColor: _azul,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  // color: const Color.fromRGBO(168, 201, 174, 1),
                  color: _verde,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      (context),
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            SobreTela(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
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
                          // color: Color.fromRGBO(168, 201, 174, 1),
                          color: _verde,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      height: double.infinity,
                      width: 160,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Center(
                              child: Text(
                                "Sobre o Parque",
                                style: TextStyle(
                                  color: _azul,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            color: _azul,
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  elevation: 10,
                  shadowColor: _azul,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  color: _verde,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      (context),
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            DicionarioTela(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      height: double.infinity,
                      width: 160,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Center(
                              child: Text(
                                "Dicionário Botânico",
                                style: TextStyle(
                                  color: _azul,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            color: _azul,
                            height: 1,
                            width: MediaQuery.of(context).size.width * 0.40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
