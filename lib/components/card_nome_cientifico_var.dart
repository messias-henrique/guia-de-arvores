// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

final Color _verde = Color.fromRGBO(194, 213, 155, 1);
final Color _azul = Color.fromRGBO(55, 71, 79, 1);

class CardWidgetNomeEspecieVar extends StatelessWidget {
  const CardWidgetNomeEspecieVar(
      {required this.titulo,
      required this.italico,
      required this.normal,
      required this.italico2,
      required this.normal2,
      Key? key})
      : super(key: key);
  final String titulo;
  final String italico;
  final String normal;
  final String italico2;
  final String normal2;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Color.fromRGBO(55, 71, 79, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.0),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    color: _verde,
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.90,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Text(
                      titulo,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: _azul,
                      ),
                      overflow: TextOverflow.visible,
                      maxLines: 100,
                      softWrap: true,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: _verde,
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.90,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Wrap(
                      children: [
                        Text(italico,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                color: _azul)),
                        Text(
                          " $normal",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            color: _azul,
                          ),
                          // overflow: TextOverflow.clip,
                          // maxLines: 100,
                          // softWrap: true,
                        ),
                        Text(" $italico2",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                color: _azul)),
                        Text(
                          " $normal2",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                            color: _azul,
                          ),
                          // overflow: TextOverflow.clip,
                          // maxLines: 100,
                          // softWrap: true,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
