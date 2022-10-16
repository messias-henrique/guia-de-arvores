// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:guia/components/widgets/card.dart';

final Color _cinza = Color.fromARGB(255, 224, 224, 224);

class SobreTela extends StatelessWidget {
  const SobreTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(
          color: Color.fromRGBO(55, 71, 79, 1), // <-- SEE HERE
        ),
        title: Text(
          "Sobre",
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
    return ListView(
      children: [
        SizedBox(
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
                        titulo: "Parque Zoobotânico de Teresina",
                        corpo:
                            "O Parque Zoobotânico de Teresina possui 137 hectares de área verde destinada à proteção que está situada no setor nordeste do perímetro urbano da cidade de Teresina, entre o rio Poti, a rodovia PI-112 e a Universidade Federal do Piauí. A vegetação do parque é descrita como remanescente de floresta estacional semidecidual, caracterizada pela queda parcial das folhas e por uma condição temporal, em que o caráter ecológico está envolvido por uma alternância, ou seja, um período chuvoso e uma estação seca.\n\nNa fisionomia vegetacional do Parque é evidente a presença da palmeira babaçu, que nessa região, acompanha os cursos dos rios Poti e Parnaíba compondo a mata ciliar.\n\nÉ marcante também a presença de espécies características desse ambiente, como angico-branco, sapucaia, cajazeira, pau-d’arco-amarelo, jatobá, dentre outras.\n\nA influência causada pela proximidade do rio Poti, e a presença de uma lagoa marginal no interior do Parque possibilitam o desenvolvimento de uma grande diversidade de plantas aquáticas, além de espécies características de matas ripárias. Em determinados locais, principalmente na área central do Parque, existe uma grande quantidade de espécies exóticas, frutíferas e ornamentais, que foram introduzidas ao longo dos anos (SEMAR, 2005).\n\n",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
