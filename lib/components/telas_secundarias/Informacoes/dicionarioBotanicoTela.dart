// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guia/components/widgets/card.dart';

var _verde = const Color.fromRGBO(168, 201, 174, 1);
var _mainColor = _verde;
final Color _cinza = Color.fromARGB(255, 224, 224, 224);

class DicionarioTela extends StatelessWidget {
  const DicionarioTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: ElevatedButton(
        //   onPressed: () => {},
        //   child: Icon(Icons.keyboard_arrow_left),
        // ),
        leading: const BackButton(
          color: Color.fromRGBO(55, 71, 79, 1), // <-- SEE HERE
        ),
        title: Text(
          "Dicionário Botânico",
          style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
        ),

        backgroundColor: const Color.fromRGBO(194, 213, 155, 1),
      ),
      body: GeraCards(),
      backgroundColor: _cinza,
    );
  }
}

class GeraCards extends StatelessWidget {
  const GeraCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('dicionario-botanico')
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: Center(
                    child: CircularProgressIndicator(
                        strokeWidth: 5,
                        color: Color.fromRGBO(194, 213, 155, 1))));
          }
          if (snapshot.hasData) {
            return ListView(
              // physics: BouncingScrollPhysics(),
              // padding: EdgeInsets.only(top: 5),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return SizedBox(
                  // color: cinza,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // SizedBox(
                      //   width: double.infinity,
                      //   height: 40,
                      // ),
                      SizedBox(
                        child: Column(
                          children: [
                            // Imagens ----------------------------------------------------------------------------------

                            // Nome Científico -----------------------
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CardWidget(
                                titulo: data['nome'],
                                corpo: data['texto'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          }
          return SizedBox();
        });
  }
}
