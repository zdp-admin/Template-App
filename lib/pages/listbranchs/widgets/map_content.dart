import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Widget mapContent(BuildContext context, Completer<GoogleMapController> controllerMap, Set<Marker> markers) {

  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(23.900985, -102.550846),
    zoom: 6
  );

  return GoogleMap(
    mapType: MapType.normal,
    initialCameraPosition: cameraPosition,
    onMapCreated: (GoogleMapController controller) {
      controllerMap.complete(controller);
    },
    myLocationEnabled: true,
    myLocationButtonEnabled: true,
    markers: markers
  );
}