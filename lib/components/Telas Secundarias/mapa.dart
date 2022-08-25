// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'forMap.dart';

void main() => runApp(Maps());

class Maps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapSample();
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  // Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  // LatLng _center = LatLng(-5.040402451818661, -42.768562664403476);
  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(-5.040402451818661, -42.768562664403476),
  //   zoom: 14.4746,
  // );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    // final googleOffices = LatLng(-5.040402451818661, -42.768562664403476);
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("Parque"),
        position: LatLng(-5.041078490719873, -42.76854824813978),
        infoWindow: InfoWindow(
          title: "Parque Zoobotânico de Teresina",
          snippet: "",
        ),
      );
      _markers["Parque"] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(onTap: () {
        MapUtils.openMap(-5.0460146, -42.7802205);
      }),
      // body: GoogleMap(
      //   onMapCreated: _onMapCreated,
      //   initialCameraPosition: const CameraPosition(
      //     target: LatLng(-5.041078490719873, -42.76854824813978),
      //     zoom: 14.4746,
      //   ),
      //   markers: _markers.values.toSet(),
      // ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
