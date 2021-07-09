import 'dart:async';

import 'package:Food_Delivery/Screens/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

String userUid;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getUid() async {
    //Create a Method...
    SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance(); //9.3
    userUid = sharedPreferences.getString('uid'); //9.4
    print(userUid);
  }

  @override
  void initState() {
    getUid().whenComplete(() {
      //9.5...
      Timer(
          Duration(seconds: 5),
          () => Navigator.pushReplacement(
              context,
              PageTransition(
                  child: userUid == null ? LoginPage() : HomeScreen(),
                  type: PageTransitionType.bottomToTop)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 200,
                    width: 400,
                    child: Lottie.asset("animation/pizza-delivery.json"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/lapinozlogo.png",
                        height: 65,
                        width: 65,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "L",
                        style: GoogleFonts.kaushanScript(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff1B5E20),
                        ),
                      ),
                      Text(
                        "a",
                        style: GoogleFonts.kaushanScript(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.red),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Pino`z",
                        style: GoogleFonts.kaushanScript(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff1B5E20),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "P",
                        style: GoogleFonts.kaushanScript(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        "izz",
                        style: GoogleFonts.kaushanScript(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff1B5E20),
                        ),
                      ),
                      Text(
                        "a",
                        style: GoogleFonts.kaushanScript(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 320),
            child: Container(
              height: size.height * 0.1,
              width: size.width,
              color: Colors.transparent,
              child: Column(
                children: [
                  Image.asset(
                    "images/medical-mask.png",
                    height: 50,
                    width: 50,
                  ),
                  Text(
                    "Be Safe Be CareFul",
                    style: GoogleFonts.risque(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 260, top: 220),
            child: Lottie.asset(
              "animation/22795-pizza-slice.json",
              height: 55,
              width: 55,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 100),
            child: Lottie.asset(
              "animation/23145-burger-hd.json",
              height: 100,
              width: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 250),
            child: Lottie.asset(
              "animation/26546-loader-fries.json",
              height: 60,
              width: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, top: 50),
            child: Lottie.asset(
              "animation/18534-flying-hotdog.json",
              height: 80,
              width: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, top: 180),
            child: Lottie.asset(
              "animation/21451-coffee-and-love.json",
              height: 80,
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}
