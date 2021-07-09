import 'package:Food_Delivery/Helpers/utilites.dart';
import 'package:Food_Delivery/Screens/my_cart.dart';
import 'package:Food_Delivery/Services/mange_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MyCartLocation extends StatefulWidget {
  @override
  _MyCartLocatiomState createState() => _MyCartLocatiomState();
}

class _MyCartLocatiomState extends State<MyCartLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Provider.of<ManageData>(context, listen: false).fetchMap(),
            Positioned(
                top: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    Utility.isBack = true;
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: MyCart(),
                            type: PageTransitionType.leftToRight));
                  },
                ))
          ],
        ),
      ),
    );
  }
}
