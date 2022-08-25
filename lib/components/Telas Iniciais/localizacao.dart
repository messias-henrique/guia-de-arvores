// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guia/components/Telas%20Secundarias/dicionarioBotanicoTela.dart';
import 'package:guia/components/Telas%20Secundarias/sobreTela.dart';

import '../Telas Secundarias/forMap.dart';
import '../Telas Secundarias/galeria.dart';

final _verde = Color.fromRGBO(194, 213, 155, 1);
final _azul = Color.fromRGBO(55, 71, 79, 1);

class LocTela extends StatelessWidget {
  const LocTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              elevation: 5,
              shadowColor: _azul,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.0),
              ),
              color: _verde,
              child: InkWell(
                onTap: () => MapUtils.openMap(-5.0460146, -42.7802205),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/imagens/maps.png'),
                      fit: BoxFit.fill,
                      opacity: 0.9,
                    ),
                    color: _verde,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  // width: MediaQuery.of(context).size.width * 0.50,
                  width: MediaQuery.of(context).size.width * 0.50,

                  height: 200,
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 10,
                      //   width: 10,
                      // ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _verde,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "Google Maps",
                              style: TextStyle(
                                color: _azul,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      //   width: 10,
                      // ),
                      // Container(
                      //   alignment: Alignment.center,
                      //   color: _azul,
                      //   height: 1,
                      //   width: (MediaQuery.of(context).size.width < 450)
                      //       ? MediaQuery.of(context).size.width * 0.35
                      //       : MediaQuery.of(context).size.width * 0.20,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
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
                        Galeria(
                      nome: "Mapa Ilustrado",
                      pasta: 'imagens',
                      uriAsset: "assets/imagens/mapa_ilustrado.png",
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
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
                    image: DecorationImage(
                      image: AssetImage('assets/imagens/mapa_ilustrado.png'),
                      fit: BoxFit.fill,
                      opacity: 0.9,
                    ),
                    color: _verde,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  // width: MediaQuery.of(context).size.width * 0.50,
                  width: MediaQuery.of(context).size.width * 0.50,

                  height: 200,
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 10,
                      //   width: 10,
                      // ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: _verde,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              "Mapa Ilustrado",
                              style: TextStyle(
                                color: _azul,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 10,
                      //   width: 10,
                      // ),
                      // Container(
                      //   alignment: Alignment.center,
                      //   color: _azul,
                      //   height: 1,
                      //   width: (MediaQuery.of(context).size.width < 450)
                      //       ? MediaQuery.of(context).size.width * 0.35
                      //       : MediaQuery.of(context).size.width * 0.20,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   // decoration: BoxDecoration(
            //   //   image: DecorationImage(
            //   //     image: AssetImage('assets/imagens/aroeira/1.jpg'),
            //   //     fit: BoxFit.fill,
            //   //     opacity: 0.9,
            //   //   ),
            //   //   color: _verde,
            //   //   borderRadius: BorderRadius.all(
            //   //     Radius.circular(10.0),
            //   //   ),
            //   // ),
            //   margin: EdgeInsets.only(left: 8, right: 8),
            //   height: MediaQuery.of(context).size.height * 0.2,
            //   width: MediaQuery.of(context).size.width * 0.5,
            //   child: Padding(
            //     padding: EdgeInsets.all(2.0),
            //     child: Card(
            //       elevation: 10,
            //       shadowColor: _azul,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(11.0),
            //       ),
            //       // color: const Color.fromRGBO(168, 201, 174, 1),
            //       color: _verde,
            //       child: InkWell(
            //         onTap: () => MapUtils.openMap(-5.0460146, -42.7802205),
            //         child: Container(
            //           decoration: BoxDecoration(
            //               // color: Color.fromRGBO(168, 201, 174, 1),
            //               image: DecorationImage(
            //                 image: AssetImage('assets/imagens/aroeira/1.jpg'),
            //                 fit: BoxFit.fill,
            //                 opacity: 0.9,
            //               ),
            //               borderRadius:
            //                   BorderRadius.all(Radius.circular(10.0))),
            //           height: double.infinity,
            //           width: 160,
            //           child: Column(
            //             children: [
            //               // SizedBox(
            //               //   height: 10,
            //               //   width: 10,
            //               // ),
            //               Align(
            //                 alignment: Alignment.centerLeft,
            //                 child: Container(
            //                   color: _verde,
            //                   height: 40,
            //                   width: MediaQuery.of(context).size.width,
            //                   child: Center(
            //                     child: Text(
            //                       "Google Maps",
            //                       style: TextStyle(
            //                         color: _azul,
            //                         fontSize: 16,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 10,
            //                 width: 10,
            //               ),
            //               Container(
            //                 alignment: Alignment.center,
            //                 color: _azul,
            //                 height: 1,
            //                 width: MediaQuery.of(context).size.width * 0.35,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(left: 8, right: 8),
            //   height: MediaQuery.of(context).size.height * 0.2,
            //   width: MediaQuery.of(context).size.width * 0.5,
            //   child: Padding(
            //     padding: const EdgeInsets.all(2.0),
            //     child: Card(
            //       elevation: 10,
            //       shadowColor: _azul,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(11.0),
            //       ),
            //       color: _verde,
            //       child: InkWell(
            //         onTap: () => Navigator.push(
            //           (context),
            //           PageRouteBuilder(
            //             pageBuilder: (context, animation, secondaryAnimation) =>
            //                 DicionarioTela(),
            //             transitionsBuilder:
            //                 (context, animation, secondaryAnimation, child) {
            //               const begin = Offset(1.0, 0.0);
            //               const end = Offset.zero;
            //               const curve = Curves.ease;

            //               var tween = Tween(begin: begin, end: end)
            //                   .chain(CurveTween(curve: curve));

            //               return SlideTransition(
            //                 position: animation.drive(tween),
            //                 child: child,
            //               );
            //             },
            //           ),
            //         ),
            //         child: Container(
            //           decoration: BoxDecoration(
            //               borderRadius:
            //                   BorderRadius.all(Radius.circular(10.0))),
            //           height: double.infinity,
            //           width: 160,
            //           child: Column(
            //             children: [
            //               SizedBox(
            //                 height: 10,
            //                 width: 10,
            //               ),
            //               Align(
            //                 alignment: Alignment.centerLeft,
            //                 child: Center(
            //                   child: Text(
            //                     "Dicionário Botânico",
            //                     style: TextStyle(
            //                       color: _azul,
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 10,
            //                 width: 10,
            //               ),
            //               Container(
            //                 alignment: Alignment.center,
            //                 color: _azul,
            //                 height: 1,
            //                 width: MediaQuery.of(context).size.width * 0.40,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
