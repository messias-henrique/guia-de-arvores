import 'package:flutter/material.dart';

var _verde = const Color.fromRGBO(168, 201, 174, 1);
var _mainColor = _verde;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cores',
      theme: ThemeData(
          //primarySwatch: Colors.teal,
          ),
      home: const Familia(),
    );
  }
}

class Familia extends StatefulWidget {
  const Familia({Key? key}) : super(key: key);

  @override
  State<Familia> createState() => _FamiliaState();
}

class _FamiliaState extends State<Familia> {
  final List<String> nameCards = [
    "Espécies",
    "Famílias",
    "Ordens",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Famílias",
          style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
        )),
        backgroundColor: const Color.fromRGBO(168, 201, 174, 1),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 400,
          ),
          ListView(
            shrinkWrap: true,
            children: [
              // Container(
              //     width: 150,
              //     padding: const EdgeInsets.all(4),
              //     color: _mainColor,
              //     margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
              //     child: Text(
              //       lista1[0],
              //       style: const TextStyle(fontSize: 24, color: Colors.white),
              //     )),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.only(left: 8, right: 8),
                height: 300,
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11.0),
                            ),
                            color: const Color.fromRGBO(168, 201, 174, 1),
                            child: InkWell(
                              onTap: () => {},
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(168, 201, 174, 1),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
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
                                          fontFamily: 'Montserrat',
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
                                    // Card(
                                    //   child: Column(
                                    //     children: [
                                    //       Container(
                                    //         color: const Color.fromRGBO(
                                    //             168, 201, 174, 1),
                                    //         width: 160,
                                    //         child: Column(children: [
                                    //           const SizedBox(
                                    //             height: 10,
                                    //             width: 10,
                                    //           ),
                                    //           Align(
                                    //             alignment: Alignment.centerLeft,
                                    //             child: Text(
                                    //               "  " + nameCards[index],
                                    //               style: const TextStyle(
                                    //                 color: Color.fromRGBO(
                                    //                     55, 71, 79, 1),
                                    //                 fontFamily: 'Montserrat',
                                    //                 fontSize: 15,
                                    //                 fontWeight: FontWeight.bold,
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           const SizedBox(
                                    //             height: 10,
                                    //             width: 10,
                                    //           ),
                                    //         ]),
                                    //       ),
                                    //       // const SizedBox(
                                    //       //   width: 30,
                                    //       //   height: 30,
                                    //       // ),
                                    //       // Container(
                                    //       //   color: const Color.fromRGBO(
                                    //       //       168, 201, 174, 1),
                                    //       //   width: 30,
                                    //       //   height: 30,
                                    //       // )
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        width: 100,
        alignment: const Alignment(0.0, -1.0),
        color: Colors.white,
        //color: const Color.fromRGBO(70, 84, 111, 1),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //HOME
                RawMaterialButton(
                  onPressed: () => {},
                  fillColor: const Color.fromRGBO(232, 245, 233, 1),
                  child: const Icon(
                    Icons.home,
                    color: Color.fromRGBO(55, 71, 79, 1),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  shape: const CircleBorder(),
                ),
                //Localização
                RawMaterialButton(
                  onPressed: () {},
                  fillColor: const Color.fromRGBO(232, 245, 233, 1),
                  child: const Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(55, 71, 79, 1),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  shape: const CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  fillColor: const Color.fromRGBO(232, 245, 233, 1),
                  child: const Icon(
                    Icons.announcement,
                    color: Color.fromRGBO(55, 71, 79, 1),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  shape: const CircleBorder(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
