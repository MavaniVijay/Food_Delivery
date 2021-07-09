import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapF extends StatefulWidget {
  @override
  _GoogleMapState createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMapF> {
  GoogleMapController mapController;
  Set<Marker> markers = Set();
  LatLng center = LatLng(45.521563, -122.677433);
  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: center,
                zoom: 11.0,
              ),
              markers: markers,
              myLocationEnabled: true,
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: TextButton.icon(
                  onPressed: () {
                    // getRouteCoordinates(center,LatLng(21.206912,72.888419));
                  },
                  icon: Icon(Icons.directions),
                  label: Text('Direction'),
                ))
          ],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    // _controller.complete(controller);
    mapController = controller;
  }

  void getCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((value) => {
          print("LOCATION ${value.latitude} ${value.longitude}"),
          center = LatLng(value.latitude, value.longitude)
        });

    mapController.animateCamera(CameraUpdate.newLatLngZoom(center, 10));
    markers.add(
      Marker(
        markerId: MarkerId('marker1'),
        position: center,
      ),
    );
    setState(() {});
    print("LOCATION 1 ${center.latitude} ${center.longitude}");
  }
}
