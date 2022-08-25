// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

class Galeria extends StatelessWidget {
  const Galeria(
      {required this.nome,
      required this.pasta,
      required this.uriAsset,
      Key? key})
      : super(key: key);
  final String nome;
  final String pasta;
  final String uriAsset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(
          color: Color.fromRGBO(55, 71, 79, 1), // <-- SEE HERE
        ),
        title: Text(
          nome,
          style: TextStyle(color: Color.fromRGBO(55, 71, 79, 1)),
        ),
        backgroundColor: const Color.fromRGBO(194, 213, 155, 1),
      ),
      body: Container(
        color: Colors.white,
        child: PhotoView(
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,
          imageProvider: AssetImage(uriAsset),
          // imageProvider: AssetImage("assets/imagens/$pasta/${numero + 1}.jpg"),
        ),
        // child: PhotoViewGallery.builder(
        //     scrollPhysics: BouncingScrollPhysics(),
        //     itemCount: quantImagens,
        //     loadingBuilder: (context, event) => Center(
        //           child: SizedBox(
        //             width: 20.0,
        //             height: 20.0,
        //             child: CircularProgressIndicator(),
        //           ),
        //         ),
        //     builder: (context, index) {
        //       return PhotoViewGalleryPageOptions(
        //         imageProvider:
        //             AssetImage("assets/imagens/$pasta/${index + 1}.jpg"),
        //         minScale: PhotoViewComputedScale.contained * 0.8,
        //         maxScale: PhotoViewComputedScale.covered * 2,
        //       );
        //     }),
      ),
    );
  }
}
