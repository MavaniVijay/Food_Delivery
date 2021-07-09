import 'package:Food_Delivery/Services/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart' as geoco;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ManageData extends ChangeNotifier {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  GoogleMapController _controller;
  Set<Marker> markers = Set();
  LatLng center = LatLng(45.521563, -122.677433);
  String countryName, mainAddress = "Mock Address";
  String get getCountryName => countryName;
  String get getMainAddress => mainAddress;
  Future fetchData(String collections) async {
    QuerySnapshot querySnapshot =
        await _firebaseFirestore.collection(collections).get();
    return querySnapshot.docs;
  }

  //No Idea Which is use in method.
  Future submitData(BuildContext context, dynamic data) {
    return _firebaseFirestore
        .collection('MyOrder')
        .doc(Provider.of<LoginAuthentication>(context, listen: false).getUid)
        .set(data);
  }

  Widget fetchMap() {
    return GoogleMap(
      myLocationEnabled: true,
      mapToolbarEnabled: true,
      myLocationButtonEnabled: true,
      onMapCreated: (GoogleMapController mapController) {
        _controller = mapController;
        markers.add(
          Marker(
            markerId: MarkerId('marker1'),
            position: center,
          ),
        );
        notifyListeners();
      },
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(target: center, zoom: 20),
      markers: markers,
      onTap: (loc) async {
        final cords = geoco.Coordinates(loc.latitude, loc.longitude);
        var address =
            await geoco.Geocoder.local.findAddressesFromCoordinates(cords);
        print(address);
        countryName = address.first.countryName;
        mainAddress = address.first.addressLine;
        // Print All data.......
        print(loc);
        print(mainAddress);
        print(countryName);
      },
    );
  }

  getMakers(double lat, double long) {
    MarkerId markerId = MarkerId(lat.toString() + long.toString());
    Marker marker = Marker(
      markerId: markerId,
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(lat, long),
      infoWindow: InfoWindow(title: mainAddress, snippet: "Country Name"),
    );
    print("GetMarkers ===>>> ${marker}");
    print("MarkerId ====>  ${markerId}");
    //marker[markerId] = marker;
  }

  void getCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((value) => {
          print("LOCATION ${value.latitude} ${value.longitude}"),
          center = LatLng(value.latitude, value.longitude)
        });

    _controller.animateCamera(CameraUpdate.newLatLngZoom(center, 10));
    markers.add(
      Marker(
        markerId: MarkerId('marker1'),
        position: center,
      ),
    );
    //setState(() {});
    print("LOCATION 1 ${center.latitude} ${center.longitude}");
  }
}
// Widget data (){
//   return  Container(
//     child: GoogleMap(
//       onMapCreated: _onMapCreated,
//       initialCameraPosition: const CameraPosition(
//         target: LatLng(-33.852, 151.211),
//         zoom: 11.0,
//       ),
//       markers: Set<Marker>.of(markers.values),
//     ),
//   );
// }
