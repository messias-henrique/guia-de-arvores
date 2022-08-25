// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:guia/components/Telas%20Secundarias/card_dicionario.dart';
import 'package:guia/components/Telas%20Secundarias/galeria.dart';
import 'package:guia/components/card.dart';
import 'package:guia/components/card_nome_cientifico.dart';
import 'package:guia/components/column_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'card_nome_cientifico_var.dart';
import 'package:carousel_slider/carousel_slider.dart';

final Color cinza = Color.fromARGB(255, 224, 224, 224);
final Color _color1 = const Color.fromRGBO(194, 213, 155, 1);
final Color _color2 = Color.fromRGBO(55, 71, 79, 1);

class EspecieTela extends StatefulWidget {
  const EspecieTela(
      {required this.nome,
      required this.pasta,
      required this.quantImagens,
      Key? key})
      : super(key: key);
  final String nome;
  final String pasta;
  final int quantImagens;
  @override
  State<EspecieTela> createState() => _EspecieTelaState();
}

class _EspecieTelaState extends State<EspecieTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(
          color: Color.fromRGBO(55, 71, 79, 1), // <-- SEE HERE
        ),
        title: Text(
          widget.nome,
          style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
        ),
        backgroundColor: const Color.fromRGBO(194, 213, 155, 1),
      ),
      body: Especie(
          nome: widget.nome,
          pasta: widget.pasta,
          quantImagens: widget.quantImagens),
      backgroundColor: cinza,
    );
  }
}

class Especie extends StatefulWidget {
  Especie(
      {required this.nome,
      required this.pasta,
      required this.quantImagens,
      Key? key})
      : super(key: key);
  final String nome;
  final String pasta;
  final int quantImagens;

  @override
  State<Especie> createState() => _EspecieState();
}

class _EspecieState extends State<Especie> {
  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void>? _launched;
    final Uri toLaunch =
        Uri(scheme: 'https', host: 'www.cylog.org', path: 'headers/');
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('especies')
            .where('id', isEqualTo: widget.pasta)
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

                List<String> dicionario = [];
                for (var i = 0; i < data['dicionario'].length; i++) {
                  dicionario.add((data['dicionario'][i]));
                }

                List<String> imagens = [];
                for (var i = 0; i < widget.quantImagens; i++) {
                  imagens.add("assets/imagens/${widget.pasta}/${i + 1}.jpg");
                }

                final List<Widget> imageSliders = imagens
                    .map((uri) => SizedBox(
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                (context),
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      Galeria(
                                    nome: widget.nome,
                                    pasta: widget.pasta,
                                    uriAsset: uri,
                                  ),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(0.0, 1.0);
                                    const end = Offset.zero;
                                    const curve = Curves.ease;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));

                                    return SlideTransition(
                                      position: animation.drive(tween),
                                      child: child,
                                    );
                                  },
                                ),
                              ),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.asset(uri,
                                          fit: BoxFit.cover, width: 1000.0),
                                      Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20.0),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ))
                    .toList();

                return SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            // Título - Imagens --------------------------------------

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  // padding: const EdgeInsets.only(
                                  //     left: 15.0, top: 4.0),
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(
                                      "Imagens",
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
                                ),
                              ),
                            ),

                            Container(color: Colors.white, height: 20),
                            // Imagens ----------------------------------------------------------------------------------
                            Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height * 0.32,
                              width: MediaQuery.of(context).size.width,
                              // padding: EdgeInsets.only(left: 10.0),
                              child: Column(children: [
                                SizedBox(
                                  child: CarouselSlider(
                                    items: imageSliders,
                                    carouselController: _controller,
                                    options: CarouselOptions(
                                        enableInfiniteScroll: false,
                                        autoPlay: false,
                                        enlargeCenterPage: false,
                                        aspectRatio: 1.8,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _current = index;
                                          });
                                        }),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                      imagens.asMap().entries.map((entry) {
                                    return GestureDetector(
                                      onTap: () =>
                                          _controller.animateToPage(entry.key),
                                      child: Container(
                                        width: 12.0,
                                        height: 12.0,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                (Theme.of(context).brightness ==
                                                            Brightness.dark
                                                        ? Colors.black
                                                        : _color2)
                                                    .withOpacity(
                                                        _current == entry.key
                                                            ? 1.0
                                                            : 0.2)),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ]),
                            ),
                            // Container(
                            //   color: Colors.white,
                            //   height: MediaQuery.of(context).size.height * 0.45,
                            //   width: MediaQuery.of(context).size.width,
                            //   padding: EdgeInsets.only(left: 10.0),
                            //   child: ListView.builder(
                            //     physics: const BouncingScrollPhysics(),
                            //     itemCount: (widget.quantImagens == 3)
                            //         ? widget.quantImagens
                            //         : 2,
                            //     itemBuilder: (context, index) {
                            //       return Padding(
                            //           padding: EdgeInsets.only(
                            //               right: 15.0, top: 10.0, bottom: 10.0),
                            //           child: InkWell(
                            //             onTap: () => Navigator.push(
                            //               (context),
                            //               PageRouteBuilder(
                            //                 pageBuilder: (context, animation,
                            //                         secondaryAnimation) =>
                            //                     Galeria(
                            //                         nome: widget.nome,
                            //                         pasta: widget.pasta,
                            //                         numero: index),
                            //                 transitionsBuilder: (context,
                            //                     animation,
                            //                     secondaryAnimation,
                            //                     child) {
                            //                   const begin = Offset(1.0, 0.0);
                            //                   const end = Offset.zero;
                            //                   const curve = Curves.ease;

                            //                   var tween = Tween(
                            //                           begin: begin, end: end)
                            //                       .chain(
                            //                           CurveTween(curve: curve));

                            //                   return SlideTransition(
                            //                     position:
                            //                         animation.drive(tween),
                            //                     child: child,
                            //                   );
                            //                 },
                            //               ),
                            //             ),
                            //             child: Container(
                            //               width: (widget.quantImagens == 3)
                            //                   ? MediaQuery.of(context)
                            //                           .size
                            //                           .height *
                            //                       0.20
                            //                   : MediaQuery.of(context)
                            //                           .size
                            //                           .height *
                            //                       0.30,
                            //               decoration: BoxDecoration(
                            //                   borderRadius:
                            //                       BorderRadius.circular(11.0),
                            //                   color: Colors.black12,
                            //                   image: DecorationImage(
                            //                       image: AssetImage(
                            //                         "assets/imagens/${widget.pasta}/${index + 1}.jpg",
                            //                       ),
                            //                       fit: BoxFit.cover),
                            //                   shape: BoxShape.rectangle,
                            //                   boxShadow: [
                            //                     BoxShadow(
                            //                       blurRadius: 5.0,
                            //                       color: Colors.black38,
                            //                     )
                            //                   ]),
                            //             ),
                            //           ));
                            //     },
                            //     scrollDirection: Axis.horizontal,
                            //     // itemCount: 3,
                            //     addAutomaticKeepAlives: true,
                            //   ),
                            // ),

                            // ------------------------------------------------------------------------------------------
                            // Nome Científico -----------------------
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: (data['var'] == false)
                                  ? CardWidgetNomeEspecie(
                                      titulo: "Nome científico",
                                      italico: data['nome_cientifico_italico'],
                                      normal: data['nome_cientifico'])
                                  : CardWidgetNomeEspecieVar(
                                      titulo: "Nome científico",
                                      italico: data['nome_cientifico_italico'],
                                      normal: data['nome_cientifico'],
                                      italico2:
                                          data['nome_cientifico_italico_2'],
                                      normal2: data['nome_cientifico_2'],
                                    ),
                            ),

                            // Classificação -----------------------
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CardWidget(
                                  titulo: "Classificação",
                                  corpo:
                                      "Família: ${data['familia']}\nOrdem: ${data['ordem']}\nClasse: ${data['classe']}\nDivisão: ${data['divisao']}\nReino: Plantae"),
                            ),
                            // Nome populares------------------------
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CardWidget(
                                  titulo: "Nomes populares",
                                  corpo: data['nomes_populares']),
                            ),
                            // Ocorrência------------------------
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CardWidget(
                                  titulo: "Ocorrência",
                                  corpo: data['ocorrencia']),
                            ),

                            // Caracteristicas------------------------
                            Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CardWidget(
                                    titulo: "Características morfológicas",
                                    corpo: data['caracteristicas'])),
                            //Informações ------------------------
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CardWidget(
                                  titulo:
                                      "Informações Ecológicas e/ou Fenologia",
                                  corpo: data['informacoes']),
                            ),
                            // Utilidades -----------------------
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CardWidget(
                                  titulo: "Utilidades",
                                  corpo: data['utilidades']),
                            ),
                            // Utilidades -----------------------
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CardWidget(
                                  titulo: "Bibliografia consultada",
                                  corpo: data['bibliografia']),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () => setState(() {
                                    _launched = _launchInWebViewOrVC(
                                        Uri.parse(data['link'].toString()));
                                  }),
                                  // child: const Text('SiBBr link',
                                  //     style: TextStyle(
                                  //       color: Colors.blue,
                                  //       decoration: TextDecoration.underline,
                                  //     )),
                                  child: CardWidget(
                                      titulo: 'SiBBr',
                                      corpo:
                                          "Clique nesse card para ser direcionado a página do SISTEMA BRASILEIRO SOBRE A BIODIVERSIDADE BRASILEIRA (SiBBr) referente a essa espécie."),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CardDicionario(
                                lista: dicionario..sort(),
                              ),
                            ),
                            // Container(
                            //   height: 400,
                            //   width: double.infinity,
                            //   child: ColumnBuilder(
                            //     itemCount: dicionario.length,
                            //     itemBuilder: (context, index) {
                            //       return StreamBuilder<QuerySnapshot>(
                            //         stream: FirebaseFirestore.instance
                            //             .collection('dicionario-botanico')
                            //             .where('id',
                            //                 isEqualTo: dicionario[index])
                            //             .snapshots(),
                            //         builder: (BuildContext context, snapshot) {
                            //           if (!snapshot.hasData) {
                            //             return Center(
                            //                 child: CircularProgressIndicator(
                            //                     strokeWidth: 5,
                            //                     color: Color.fromRGBO(
                            //                         194, 213, 155, 1)));
                            //           }
                            //           if (snapshot.hasData) {
                            //             return ListView(
                            //               physics: BouncingScrollPhysics(),
                            //               scrollDirection: Axis.horizontal,
                            //               children: snapshot.data!.docs
                            //                   .map((DocumentSnapshot document) {
                            //                 Map<String, dynamic> data2 =
                            //                     document.data()!
                            //                         as Map<String, dynamic>;

                            //                 return Padding(
                            //                   padding:
                            //                       const EdgeInsets.all(2.0),
                            //                   child: CardWidget(
                            //                     titulo: "${data2['nome']}",
                            //                     corpo: "${data2['id']}",
                            //                   ),
                            //                 );
                            //               }).toList(),
                            //             );
                            //           }
                            //           return SizedBox();
                            //         },
                            //       );
                            //     },
                            //   ),
                            // ),
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
