import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Input extends StatelessWidget {
  const Input({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    input() {
      var firebase = FirebaseFirestore.instance.collection('especies');
      firebase.doc('urucum').update({
        "id": "urucum",
        "bibliografia":
            "Carvalho (1999), Lorenzi(2002), Mello e Eira (1995), Reith (1971).",
        "nomes_populares": "Urucu, Urucum, Colorau, Açafroa.",
        "divisao": "Magnoliophyta",
        "classe": "Magnoliopsida",
        "nome": "Urucum",
        "nome_cientifico": "L.",
        "nome_cientifico_italico": "Bixa orellana",
        "familia": "Bixaceae",
        "ordem": "Malvales",
        "quantidade_imagens": 3,
        "informacoes":
            "Floresce durante a primavera e início do verão. Os amadurecem no final do verão e início do outono.",
        "utilidades":
            "Espécie economicamente importante com alto potencial para a indústria farmacêutica,têxtil e alimentícia. Suas sementes possuem um arilo pastoso rico em carotenoides. Entre os corantes naturais, o urucum é o segundo em importância econômica. Pela rapidez de crescimento em ambientes abertos, é útil na reutilização de áreas degradadas.",
        "ocorrencia":
            "Regiões Amazônicas até a Bahia, na floresta pluvial, geralmente ao longo de rios e largamente cultivada na floresta pelos índios.",
        "link":
            "https://ala-bie.sibbr.gov.br/ala-bie/species/326647?lang=pt_BR#overview"
      }).then((_) {
        print("success!");
      });
    }

    return Container();
  }
}
