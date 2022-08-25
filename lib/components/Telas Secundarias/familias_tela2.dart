// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guia/components/card_especie.dart';

var _iconColor = Color.fromRGBO(55, 71, 79, 1);

class FamiliasTela extends StatefulWidget {
  const FamiliasTela({Key? key}) : super(key: key);

  @override
  State<FamiliasTela> createState() => _FamiliasTelaState();
}

List<Widget> cardEspecies = [];

class _FamiliasTelaState extends State<FamiliasTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(
          color: Color.fromRGBO(55, 71, 79, 1), // <-- SEE HERE
        ),
        title: Text(
          "Famílias",
          style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
        ),
        backgroundColor: const Color.fromRGBO(194, 213, 155, 1),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('familias').snapshots(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: Center(
                        child: CircularProgressIndicator(
                            strokeWidth: 5,
                            color: Color.fromRGBO(194, 213, 155, 1))));
              }
              if (snapshot.hasData) {
                return GridView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(20),
                  // padding: EdgeInsets.only(top: 20, bottom: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 250),
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          // color: Colors.white,
                          height: 20,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text(
                                "${data['nome']}",
                                style: TextStyle(
                                  color: Color.fromRGBO(55, 71, 79, 1),
                                  //fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.featured_play_list_rounded,
                                color: _iconColor,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Color.fromRGBO(55, 71, 79, 1),
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 2,
                        ),
                        Expanded(
                          child: Container(
                            height: 216,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('especies')
                                  .where('familia', isEqualTo: data['nome'])
                                  .snapshots(),
                              builder: (BuildContext context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 5,
                                      color: Color.fromRGBO(194, 213, 155, 1),
                                    ),
                                  );
                                }
                                if (snapshot.hasData) {
                                  return ListView(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    children: snapshot.data!.docs
                                        .map((DocumentSnapshot document) {
                                      Map<String, dynamic> data2 = document
                                          .data()! as Map<String, dynamic>;

                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: CardEspecie(
                                            nome: "${data2['nome']}",
                                            id: "${data2['id']}",
                                            quantidadeImagens: int.parse(
                                                "${data2['quantidade_imagens']}")),
                                      );
                                    }).toList(),
                                  );
                                }
                                return SizedBox();
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              }
              return Container();
            }),
      ),
    );
  }
}
