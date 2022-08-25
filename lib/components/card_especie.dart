// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:guia/components/especie_tela.dart';

Color _azul = Color.fromRGBO(55, 71, 79, 1);
Color _verde = Color.fromRGBO(194, 213, 155, 1);

class CardEspecie extends StatelessWidget {
  const CardEspecie(
      {Key? key,
      required this.nome,
      required this.id,
      required this.quantidadeImagens})
      : super(key: key);
  final String nome;
  final String id;
  final int quantidadeImagens;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                EspecieTela(
                    nome: nome, pasta: id, quantImagens: quantidadeImagens),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

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
              image: AssetImage('assets/imagens/$id/1.jpg'),
              fit: BoxFit.fill,
              opacity: 0.9,
            ),
            color: _verde,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.50,
          // width: (MediaQuery.of(context).size.width > 450)
          //     ? 250
          //     : MediaQuery.of(context).size.width * 0.50,
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
                      nome,
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
    );
  }
}
