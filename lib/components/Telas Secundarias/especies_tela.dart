// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:guia/components/card_especie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EspeciesTela extends StatefulWidget {
  const EspeciesTela({Key? key}) : super(key: key);

  @override
  State<EspeciesTela> createState() => _EspeciesTelaState();
}

class _EspeciesTelaState extends State<EspeciesTela> {
  final Stream<QuerySnapshot> especies =
      FirebaseFirestore.instance.collection('especies').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(
          color: Color.fromRGBO(55, 71, 79, 1), // <-- SEE HERE
        ),
        title: Text(
          "Espécies",
          style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
        ),
        backgroundColor: const Color.fromRGBO(194, 213, 155, 1),
      ),
      body: Grid(),
    );
  }
}

class Grid extends StatelessWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('especies').snapshots(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
                  color: Color.fromRGBO(194, 213, 155, 1)));
        }
        if (snapshot.hasData) {
          return GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 7, crossAxisSpacing: 7),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CardEspecie(
                  nome: data['nome'],
                  id: data['id'],
                  quantidadeImagens:
                      int.parse(data['quantidade_imagens'].toString()),
                ),
              );
            }).toList(),
          );
        }
        return SizedBox();
      },
    );
  }
}
