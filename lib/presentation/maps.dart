import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';



class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
 late MapController controller;
double currentZoom = 12.0;
  @override
  void initState() {
    super.initState();
    // Initialize the map controller with the initial position
    controller = MapController(
      initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
    );

    // Add a marker to the initial position
    addMarker();
  }

  Future<void> addMarker() async {
    await controller.addMarker(
      GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
      markerIcon: MarkerIcon(
        icon: Icon(Icons.location_pin),
        //color: Colors.blue,
      ),
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Flutter OSM Plugin Map'),
    ),
    body: OSMFlutter(
      controller: controller,
      osmOption: OSMOption(
        // Other options...
      ),
 
    ),
  );
}

/*void _zoom() {
  currentZoom = currentZoom - 1;
  controller.move(currentCenter, currentZoom);
}*/

}