import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(46.48,  8.13);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.addMarker(
      MarkerOptions(
        position: LatLng(46.48, 8.13),
        infoWindowText: InfoWindowText("1.", "Murg"),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
    ),
    body: GoogleMap(
    onMapCreated: _onMapCreated,
    options: GoogleMapOptions(
    cameraPosition: CameraPosition(
    target: _center,
    zoom: 7.0,
    ),
    ),
    ),
    ),
    );
  }
}