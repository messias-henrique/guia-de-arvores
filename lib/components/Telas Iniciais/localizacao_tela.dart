// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guia/components/Telas%20Secundarias/dicionarioBotanicoTela.dart';
import 'package:guia/components/Telas%20Secundarias/mapa.dart';
import 'package:guia/components/Telas%20Secundarias/sobreTela.dart';

var _verde = const Color.fromRGBO(168, 201, 174, 1);
var _mainColor = _verde;

class LocalizacaoTela extends StatelessWidget {
  const LocalizacaoTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Maps();
    // return Center(
    //   heightFactor: MediaQuery.of(context).size.height / 2,
    //   child: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: [
    //         // SizedBox(
    //         //   width: (MediaQuery.of(context).size.width / 2) - 100,
    //         //   height: (MediaQuery.of(context).size.height / 2) - 100,
    //         // ),

    //         Container(
    //           color: Colors.white,
    //           margin: const EdgeInsets.only(left: 8, right: 8),
    //           height: MediaQuery.of(context).size.height * 0.2,
    //           width: MediaQuery.of(context).size.width * 0.5,
    //           child: Padding(
    //             padding: const EdgeInsets.all(2.0),
    //             child: Card(
    //               elevation: 10,
    //               shadowColor: Color.fromRGBO(55, 71, 79, 1),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(11.0),
    //               ),
    //               // color: const Color.fromRGBO(168, 201, 174, 1),
    //               color: const Color.fromRGBO(194, 213, 155, 1),
    //               child: InkWell(
    //                 onTap: () => Navigator.push(
    //                   (context),
    //                   PageRouteBuilder(
    //                     pageBuilder: (context, animation, secondaryAnimation) =>
    //                         DicionarioTela(),
    //                     transitionsBuilder:
    //                         (context, animation, secondaryAnimation, child) {
    //                       const begin = Offset(1.0, 0.0);
    //                       const end = Offset.zero;
    //                       const curve = Curves.ease;

    //                       var tween = Tween(begin: begin, end: end)
    //                           .chain(CurveTween(curve: curve));

    //                       return SlideTransition(
    //                         position: animation.drive(tween),
    //                         child: child,
    //                       );
    //                     },
    //                   ),

    //                   // MaterialPageRoute(
    //                   //   builder: (context) => EspecieTela(
    //                   //     nome: "${data['nome']}",
    //                   //     pasta: "${data['id']}",
    //                   //     quantImagens: int.parse(data['quantidade_imagens']),
    //                   //   ),
    //                   // ),
    //                 ),
    //                 child: AnimatedContainer(
    //                   duration: Duration(milliseconds: 300),
    //                   decoration: BoxDecoration(
    //                       // color: Color.fromRGBO(168, 201, 174, 1),
    //                       color: Color.fromRGBO(194, 213, 155, 1),
    //                       borderRadius:
    //                           BorderRadius.all(Radius.circular(10.0))),
    //                   height: double.infinity,
    //                   width: 160,
    //                   child: Column(
    //                     children: [
    //                       const SizedBox(
    //                         height: 10,
    //                         width: 10,
    //                       ),
    //                       Align(
    //                         alignment: Alignment.centerLeft,
    //                         child: Center(
    //                           child: Text(
    //                             "Dicionário Botânico",
    //                             // "     " + especies[index],
    //                             style: TextStyle(
    //                               color: Color.fromRGBO(55, 71, 79, 1),
    //                               //fontFamily: 'Montserrat',
    //                               fontSize: 16,
    //                               fontWeight: FontWeight.bold,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(
    //                         height: 10,
    //                         width: 10,
    //                       ),
    //                       Container(
    //                         alignment: Alignment.center,
    //                         color: Colors.white,
    //                         height: 1,
    //                         width: 150,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
