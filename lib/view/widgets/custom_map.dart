import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class CustomMap {

  //todo add marker bitch

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.802223342460454, 75.75755272690519),
    zoom: 14.0,
  );

  Widget getMap(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(<Marker>[Marker(markerId: MarkerId('001'),
          position: LatLng(30.802223342460454,75.75755272690519),
          infoWindow: InfoWindow(
              title: 'The Pizza Tree'))]),
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}