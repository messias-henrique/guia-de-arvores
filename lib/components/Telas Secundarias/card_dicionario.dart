// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guia/components/column_builder.dart';

final Color _color1 = Color.fromRGBO(194, 213, 155, 1);
final Color _color2 = Color.fromRGBO(55, 71, 79, 1);

class CardDicionario extends StatefulWidget {
  const CardDicionario({required this.lista, Key? key}) : super(key: key);

  final List<String> lista;

  @override
  State<CardDicionario> createState() => _CardDicionarioState();
}

class _CardDicionarioState extends State<CardDicionario> {
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
                    color: _color1,
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
                      "Dicionário Botânico",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: _color2,
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
                    color: _color1,
                    height: 1,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 10,
                  ),
                  ColumnBuilder(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    itemCount: widget.lista.length,
                    itemBuilder: (context, index) {
                      return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('dicionario-botanico')
                            .where('id', isEqualTo: widget.lista[index])
                            .snapshots(),
                        builder: (BuildContext context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                                child: Center(
                                    child: CircularProgressIndicator(
                                        strokeWidth: 5,
                                        color:
                                            Color.fromRGBO(194, 213, 155, 1))));
                          }
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, bottom: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  Map<String, dynamic> data2 =
                                      document.data()! as Map<String, dynamic>;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "- ${data2['nome']}",
                                        style: TextStyle(
                                          color: Color.fromRGBO(55, 71, 79, 1),
                                          //fontFamily: 'Montserrat',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        " ${data2['texto']}",
                                        style: TextStyle(
                                          color: Color.fromRGBO(55, 71, 79, 1),
                                          //fontFamily: 'Montserrat',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            );
                          }
                          return SizedBox();
                        },
                      );
                    },
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
