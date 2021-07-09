import 'package:Food_Delivery/Helpers/utilites.dart';
import 'package:Food_Delivery/Screens/home_page.dart';
import 'package:Food_Delivery/Screens/mycart_location.dart';
import 'package:Food_Delivery/Services/mange_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: floatinActionButton(context),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBar(context),
              headerText(context),
              cartData(context),
              SizedBox(
                height: 15,
              ),
              shippingDetails(context),
              SizedBox(
                height: 20,
              ),
              bilingDetails(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: HomeScreen(),
                        type: PageTransitionType.leftToRight));
              }),
          IconButton(
              icon: Icon(
                FontAwesomeIcons.trash,
                color: Colors.red,
              ),
              onPressed: () {}),
        ],
      ),
    );
  }

  Widget headerText(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Your",
                style: GoogleFonts.asar(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Center(
              child: Text(
                "Data",
                style: GoogleFonts.asar(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget cartData(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 20),
          ]),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('MyOrder').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset("animation/25990-home-delivery.json"),
            );
          } else {
            return Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                //shrinkWrap: true,
                children:
                    snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
                  return Container(
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.network(
                                documentSnapshot.data()['photo'],
                                height: 120,
                                width: 120,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Pizza name :",
                              style: GoogleFonts.aBeeZee(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "${documentSnapshot.data()['title']}",
                              style: GoogleFonts.risque(
                                color: Colors.green,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "\$.${documentSnapshot.data()['ruppe']}",
                              style: GoogleFonts.risque(
                                color: Colors.red,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Cheese : ${documentSnapshot.data()['cheese']}",
                              style: GoogleFonts.risque(
                                color: Colors.teal,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Onion : ${documentSnapshot.data()['onion']}",
                              style: GoogleFonts.risque(
                                color: Colors.teal,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Beacon : ${documentSnapshot.data()['beacon']}",
                              style: GoogleFonts.risque(
                                color: Colors.teal,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Corns : ${documentSnapshot.data()['corn']}",
                              style: GoogleFonts.risque(
                                color: Colors.teal,
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  "Size : ",
                                  style: GoogleFonts.risque(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.teal.shade300,
                                  radius: 15,
                                  child: Text(
                                    "${documentSnapshot.data()['size']}",
                                    style: GoogleFonts.risque(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget shippingDetails(BuildContext context) {
    bool isBack = false;
    return Center(
      child: Container(
        //constraints: BoxConstraints(minHeight: 100),
        height: 150,
        width: 330,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: Icon(FontAwesomeIcons.locationArrow),
                        onPressed: () {}),
                    Container(
                      width: 200,
                      color: Colors.white,
                      child: Text(
                        Provider.of<ManageData>(context, listen: true)
                            .getMainAddress,
                        style: GoogleFonts.risque(
                          fontSize: Utility.isBack == true ? 12 : 17,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: MyCartLocation(),
                              type: PageTransitionType.bottomToTop));
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: Icon(FontAwesomeIcons.clock), onPressed: () {}),
                    Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Text(
                        "6 PM - 8 PM",
                        style: GoogleFonts.risque(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(icon: Icon(Icons.edit), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bilingDetails(BuildContext context) {
    return Center(
      child: Container(
        height: 130,
        width: 330,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "SUBTOTAL",
                    style: GoogleFonts.raviPrakash(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.rupeeSign,
                        color: Colors.green.shade500,
                        size: 17,
                      ),
                      Text(
                        "300.0",
                        style: GoogleFonts.arvo(
                          fontSize: 17,
                          color: Colors.red.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "DELIVERY CHARGES",
                    style: GoogleFonts.raviPrakash(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.rupeeSign,
                        color: Colors.green.shade500,
                        size: 17,
                      ),
                      Text(
                        "20.0",
                        style: GoogleFonts.arvo(
                          fontSize: 17,
                          color: Colors.red.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "TOTAL",
                    style: GoogleFonts.raviPrakash(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.rupeeSign,
                        size: 17,
                      ),
                      Text(
                        "320.0",
                        style: GoogleFonts.arvo(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget floatinActionButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red.shade400,
            ),
            child: Center(
              child: Text(
                "Place Order",
                style: GoogleFonts.asar(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
