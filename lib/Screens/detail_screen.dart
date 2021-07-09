import 'package:Food_Delivery/Screens/home_page.dart';
import 'package:Food_Delivery/Services/calculation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'my_cart.dart';

class DetailScreen extends StatefulWidget {
  final QueryDocumentSnapshot queryDocumentSnapshot;

  const DetailScreen({Key key, this.queryDocumentSnapshot}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int cheeseValue = 0;
  int onionValue = 0;
  int beaconValue = 0;
  int cornValue = 0;
  int totalItem = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: floatinActionButton(context),
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //     icon: Icon(EvaIcons.arrowBack),
        //   ),
        //   title: Text(widget.queryDocumentSnapshot["text"]),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(context),
            pizzaImage(context),
            middleData(context),
            footerDetails(context),
          ],
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
              onPressed: () {
                Provider.of<Calculation>(context, listen: false)
                    .removeAllData();
              }),
        ],
      ),
    );
  }

  Widget pizzaImage(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        child: Container(
          child: Image.network(widget.queryDocumentSnapshot['image']),
        ),
      ),
    );
  }

  Widget middleData(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text("⭐"),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.queryDocumentSnapshot["rating"],
              style: GoogleFonts.voces(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.queryDocumentSnapshot['text'],
                style: GoogleFonts.anticDidone(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20),
              ),
              Row(
                children: [
                  Text("💲"),
                  Text(
                    widget.queryDocumentSnapshot['ruppes'],
                    style: GoogleFonts.almendra(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget footerDetails(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      spreadRadius: 0,
                    ),
                  ]),
              height: 280,
              width: 320,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 100, top: 20, right: 80),
                    child: Text(
                      "Add More Stuff",
                      style: GoogleFonts.risque(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Cheese",
                        style: GoogleFonts.asul(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                icon: Icon(
                                  EvaIcons.minus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  Provider.of<Calculation>(context,
                                      listen: false)
                                      .minusCheese();
                                }),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            Provider.of<Calculation>(context, listen: true)
                                .getCheesevalue
                                .toString(),
                            style: GoogleFonts.ubuntu(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                icon: Icon(
                                  EvaIcons.plus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  Provider.of<Calculation>(context,
                                          listen: false)
                                      .addCheese();
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Onions",
                        style: GoogleFonts.asul(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                icon: Icon(
                                  EvaIcons.minus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  Provider.of<Calculation>(context,
                                          listen: false)
                                      .minusOnion();
                                }),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            Provider.of<Calculation>(context, listen: true)
                                .getOniovalue
                                .toString(),
                            style: GoogleFonts.ubuntu(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                icon: Icon(
                                  EvaIcons.plus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  Provider.of<Calculation>(context,
                                          listen: false)
                                      .addOnion();
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Beacon",
                        style: GoogleFonts.asul(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                icon: Icon(
                                  EvaIcons.minus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  Provider.of<Calculation>(context,
                                          listen: false)
                                      .minusBeacon();
                                }),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            Provider.of<Calculation>(context, listen: true)
                                .getBeaconvalue
                                .toString(),
                            style: GoogleFonts.ubuntu(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                icon: Icon(
                                  EvaIcons.plus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  Provider.of<Calculation>(context,
                                          listen: false)
                                      .addBeacon();
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Cornes",
                        style: GoogleFonts.asul(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                icon: Icon(
                                  EvaIcons.minus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  Provider.of<Calculation>(context,
                                          listen: false)
                                      .minusCorn();
                                }),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            Provider.of<Calculation>(context, listen: true)
                                .getCornvalue
                                .toString(),
                            style: GoogleFonts.ubuntu(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                icon: Icon(
                                  EvaIcons.plus,
                                  size: 15,
                                ),
                                onPressed: () {
                                  Provider.of<Calculation>(context,
                                          listen: false)
                                      .addCorn();
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    Provider.of<Calculation>(context, listen: false)
                        .selectSmallSize();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Provider.of<Calculation>(context, listen: false)
                              .smallTrapped
                          ? Colors.red
                          : Colors.white,
                      border: Border.all(color: Colors.red.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "S",
                        style: GoogleFonts.libreBaskerville(fontSize: 13),
                      ),
                    ),
                  )),
              GestureDetector(
                  onTap: () {
                    Provider.of<Calculation>(context, listen: false)
                        .selectMediumSize();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Provider.of<Calculation>(context, listen: false)
                              .mediumTrapped
                          ? Colors.red
                          : Colors.white,
                      border: Border.all(color: Colors.red.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "M",
                        style: GoogleFonts.libreBaskerville(fontSize: 13),
                      ),
                    ),
                  )),
              GestureDetector(onTap: () {
                Provider.of<Calculation>(context, listen: false)
                    .selectLargeSize();
              }, child: Consumer<Calculation>(
                builder: (context, data, child) {
                  return Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Provider.of<Calculation>(context, listen: false)
                              .bigTrapped
                          ? Colors.red
                          : Colors.white,
                      border: Border.all(color: Colors.red.shade400),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "L",
                        style: GoogleFonts.libreBaskerville(fontSize: 13),
                      ),
                    ),
                  );
                },
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget floatinActionButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<Calculation>(context, listen: false)
                .addToCart(context, {
              "photo": widget.queryDocumentSnapshot["image"],
              "title": widget.queryDocumentSnapshot["text"],
              "ruppe": widget.queryDocumentSnapshot["ruppes"],
              "cheese": Provider.of<Calculation>(context, listen: false)
                  .getCheesevalue,
              "onion":
                  Provider.of<Calculation>(context, listen: false).getOniovalue,
              "beacon": Provider.of<Calculation>(context, listen: false)
                  .getBeaconvalue,
              "corn":
                  Provider.of<Calculation>(context, listen: false).getCornvalue,
              "size": Provider.of<Calculation>(context, listen: false).getSize,
            });
            Get.snackbar("Add to Cart", "Your Product Added Cart",
                duration: Duration(seconds: 3),
                snackPosition: SnackPosition.BOTTOM);
            print("Add to Cart Your Product");
          },
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red.shade400,
            ),
            child: Center(
              child: Text(
                "Add to Cart",
                style: GoogleFonts.asar(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        Stack(
          children: [
            FloatingActionButton(
              backgroundColor: Colors.green.shade300,
              onPressed: () {},
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: MyCart(),
                          type: PageTransitionType.topToBottom));
                },
                icon: Icon(
                  EvaIcons.shoppingBag,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: CircleAvatar(
                backgroundColor: Colors.green.shade500,
                radius: 10,
                child: Center(
                    child: Text(
                  '$totalItem',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
