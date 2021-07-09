import 'package:Food_Delivery/Screens/my_cart.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Footer extends ChangeNotifier {
  Widget floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.lightGreen,
      elevation: 5,
      onPressed: () {
        Navigator.pushReplacement(context,
            PageTransition(child: MyCart(), type: PageTransitionType.rotate));
      },
      child: Icon(
        EvaIcons.shoppingBag,
      ),
    );
  }
}
