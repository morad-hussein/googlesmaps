import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.033333, 31.233334),
    zoom: 11,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: {
          Marker(
            markerId: MarkerId('1'),
            position: LatLng(30.033333, 31.233334),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
              title: 'Maker 1',
              snippet: 'This is a snippet',
            ),
          ),
          Marker(
            markerId: MarkerId('2'),
            position: LatLng(30.033333, 31.263334),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
              title: 'Maker 2',
              snippet: 'This is a snippet',
            ),
          ),
          Marker(
            markerId: MarkerId('2'),
            position: LatLng(30.033333, 31.273334),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(
              title: 'Maker 2',
              snippet: 'This is a snippet',
            ),
          ),
        },
        /*polylines: {
          Polyline(
            polylineId: PolylineId("1"),
            points: [
              LatLng(30.033333, 31.263334),
              LatLng(30.033333, 31.233334),
              LatLng(30.033333, 31.273334),
            ],
            color: Colors.pinkAccent,
            width: 3,
          ),
        },*/
        polygons: {
          Polygon(
            polygonId: PolygonId('1'),
            points: [
              LatLng(30.033333, 31.233334),
              LatLng(30.033333, 31.263334),
              LatLng(30.563333, 31.263334),
            ],
            fillColor: Colors.red,

          )
        },
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
