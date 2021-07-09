import 'package:Food_Delivery/Services/mange_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculation extends ChangeNotifier {
  int cheeseValue = 0;
  int onionValue = 0;
  int beaconValue = 0;
  int cornValue = 0;
  int cartData = 0;
  String size;
  String get getSize => size;
  bool isSelected = false,
      smallTrapped = false,
      mediumTrapped = false,
      bigTrapped = false,
      selected = false;

  int get getCheesevalue => cheeseValue;
  int get getOniovalue => onionValue;
  int get getBeaconvalue => beaconValue;
  int get getCornvalue => cornValue;
  int get getCartDatavalue => cartData;
  bool get getSelected => selected;

  addCheese() {
    cheeseValue++;
    notifyListeners();
  }

  addOnion() {
    onionValue++;
    notifyListeners();
  }

  addBeacon() {
    beaconValue++;
    notifyListeners();
  }

  addCorn() {
    cornValue++;
    notifyListeners();
  }

  minusCheese() {
    cheeseValue--;
    if (cheeseValue >= 0) {
      print("cheese value ==>>> $cheeseValue");
    } else {
      cheeseValue = 0;
    }
    notifyListeners();
  }

  minusOnion() {
    onionValue--;
    if (onionValue >= 0) {
      print("onion value ==>>> $onionValue");
    } else {
      onionValue = 0;
    }
    notifyListeners();
  }

  minusBeacon() {
    beaconValue--;
    if (beaconValue >= 0) {
      print("beacon value ==>>> $beaconValue");
    } else {
      beaconValue = 0;
    }
    notifyListeners();
  }

  minusCorn() {
    cornValue--;
    if (cornValue >= 0) {
      print("corn value ==>>> $cornValue");
    } else {
      cornValue = 0;
    }
    notifyListeners();
  }

  selectSmallSize() {
    smallTrapped = true;
    size = 'S';
    notifyListeners();
  }

  selectMediumSize() {
    mediumTrapped = true;
    size = 'M';
    notifyListeners();
  }

  selectLargeSize() {
    bigTrapped = true;
    size = 'L';
    notifyListeners();
  }

  removeAllData() {
    cheeseValue = 0;
    onionValue = 0;
    beaconValue = 0;
    cornValue = 0;
    smallTrapped = false;
    mediumTrapped = false;
    bigTrapped = false;
    notifyListeners();
  }

  addToCart(BuildContext context, dynamic data) async {
    if (smallTrapped != false ||
        mediumTrapped != false ||
        bigTrapped != false) {
      cartData++;
      await Provider.of<ManageData>(context, listen: false)
          .submitData(context, data);
      notifyListeners();
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) => Container(
                height: 50,
                child: Text(
                  "Selected any size",
                  style: TextStyle(color: Colors.white),
                ),
              ));
    }
  }
}
