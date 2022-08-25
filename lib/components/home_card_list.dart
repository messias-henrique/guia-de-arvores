// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class HomeCardList extends StatelessWidget {
  final List<String> nameCards = [
    "Espécies",
    "Famílias",
    "Ordens",
  ];

  //HomeCardList(this.nameCards);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: nameCards.length,
        itemBuilder: (ctx, index) {
          //final titulo = nameCards[index];
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.0),
              ),
              color: const Color.fromRGBO(168, 201, 174, 1),
              child: InkWell(
                onTap: () => {print(nameCards[index])},
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(168, 201, 174, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  width: 160,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "  " + nameCards[index],
                          style: const TextStyle(
                            color: Color.fromRGBO(55, 71, 79, 1),
                            //fontFamily: 'Montserrat',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                      Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          height: 1,
                          width: 150),
                    ],
                  ),
                ),
              )
              // child: Row(
              //   children: [
              // Container(
              //     margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              //     decoration: BoxDecoration(
              //         border: Border.all(
              //       color: Colors.purple,
              //       width: 2,
              //     )),
              //     padding: EdgeInsets.all(10),
              //     child: Text(
              //       'R\$ ${titulo.value.toStringAsFixed(2)}',
              //       // ignore: prefer_const_constructors
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 20,
              //         color: Colors.purple,
              //       ),
              //     )),
              // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //   Text(tr.title,
              //       // ignore: prefer_const_constructors
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 16,
              //       )),
              //   Text(DateFormat('d MMM y').format(tr.date),
              //       style: const TextStyle(
              //         color: Colors.grey,
              //       ))
              // ])
              // ],
              //),
              );
        },
        // children: transactions.map((tr) {}).toList(),
      ),
    );
  }
}
