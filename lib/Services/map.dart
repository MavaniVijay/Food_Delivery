import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart' as geoCo;
import 'package:geolocator/geolocator.dart';

String finalAdderss = "Searching Address....";

class Map extends ChangeNotifier {
  Position position;
  Future getCurrentLocation() async {
    var positionData = await GeolocatorPlatform.instance.getCurrentPosition();
    final cordinate =
        geoCo.Coordinates(positionData.latitude, positionData.longitude);
    var adderss =
        await geoCo.Geocoder.local.findAddressesFromCoordinates(cordinate);
    String mainAdderss = adderss.first.addressLine;
    print(cordinate);
    print(mainAdderss);
    finalAdderss = mainAdderss;
    notifyListeners();
  }
}
