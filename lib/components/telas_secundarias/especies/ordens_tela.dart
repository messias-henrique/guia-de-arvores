// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:guia/components/widgets/card_especie.dart';

var _iconColor = Color.fromRGBO(55, 71, 79, 1);

class OrdensTela extends StatefulWidget {
  const OrdensTela({Key? key}) : super(key: key);

  @override
  State<OrdensTela> createState() => _OrdensTelaState();
}

class _OrdensTelaState extends State<OrdensTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: BackButton(
          color: Color.fromRGBO(55, 71, 79, 1),
        ),
        title: Text(
          "Ordens",
          style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
        ),
        backgroundColor: const Color.fromRGBO(194, 213, 155, 1),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('ordens').snapshots(),
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
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.only(top: 5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 0,
                  mainAxisExtent: 250,
                ),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 2,
                      ),
                      Expanded(
                        child: Container(
                          height: 216,
                          width: double.infinity,
                          color: Colors.white,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('especies')
                                .where('ordem', isEqualTo: data['nome'])
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
                                      padding: EdgeInsets.all(10.0),
                                      child: CardEspecie(
                                        nome: "${data2['nome']}",
                                        id: "${data2['id']}",
                                        quantidadeImagens: int.parse(
                                            "${data2['quantidade_imagens']}"),
                                      ),
                                    );
                                  }).toList(),
                                );
                              }
                              return SizedBox();
                            },
                          ),
                        ),
                      ),
                      Container(
                        color: Color.fromARGB(255, 206, 206, 206),
                        height: 3,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  );
                }).toList(),
              );
            }
            return Container();
          }),
    );
  }
}
