// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

final Color _verde = Color.fromRGBO(194, 213, 155, 1);
final Color _azul = Color.fromRGBO(55, 71, 79, 1);

class CardWidget extends StatelessWidget {
  const CardWidget({required this.titulo, required this.corpo, Key? key})
      : super(key: key);
  final String titulo;
  final String corpo;
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
                      corpo,
                      style: TextStyle(
                        fontSize: 18,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
