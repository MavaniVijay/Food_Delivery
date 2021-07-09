import 'package:Food_Delivery/Screens/detail_screen.dart';
import 'package:Food_Delivery/Services/mange_data.dart';
import 'package:Food_Delivery/Services/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Headers extends ChangeNotifier {
  int _selectedIndex = 0; //1. make a variable selected index integer variable

  int get selectedIndex =>
      _selectedIndex; //2. getter and setter value Alt + insert shortcut key and automatically Function make

  set selectedIndex(int value) {
    _selectedIndex = value;
    print(value);
    notifyListeners(); //3. notifiylistner must be call this function ok
  }

  Widget appbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            icon: Icon(
              FontAwesomeIcons.alignLeft,
              color: Colors.blue,
            ),
            onPressed: () {
              //Provider.of<Map>(context, listen: true).notifyListeners();
              // Scaffold.of(context).openDrawer(); // Drawer(
              //   elevation: 5,
              //   child: Container(
              //     height: 50,
              //     width: 50,
              //     color: Colors.green,
              //   ),
              // );
            }),
        Row(
          children: [
            IconButton(
                icon: Icon(
                  FontAwesomeIcons.locationArrow,
                  size: 17,
                  color: Colors.grey,
                ),
                onPressed: () {}),
            Container(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text(
                finalAdderss,
                style: GoogleFonts.aclonica(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        IconButton(icon: Icon(FontAwesomeIcons.search), onPressed: () {}),
      ],
    );
  }

  Widget headerText(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                "What makes the",
                style: GoogleFonts.alike(fontSize: 20, letterSpacing: 3),
              ),
              Text(
                "prefect Pizza?",
                style: GoogleFonts.alike(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget headerList(BuildContext context) {
    List list = [
      {'images': "images/dish.png", 'text': "All Food"},
      {"images": "images/pizza.png", 'text': "Pizza"},
      {"images": "images/burger.png", 'text': "Burger"},
      {"images": "images/hot-dog.png", 'text': "Hot Dog"},
      {"images": "images/french-fries.png", 'text': "French"},
    ];
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.transparent,
      height: size.height * 0.08,
      width: size.width,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // selectedIndex = index;
                  Provider.of<Headers>(context, listen: false).selectedIndex =
                      index; //4. provider must be use it for on tap click event on ok
                },
                child: Consumer<Headers>(
                  //jene changed karvano hoy tene must be Consumer <Class_name> create it.
                  builder: (context, data, child) {
                    //5. builder (first is context and second data is a headers class ok and child is a function)
                    return Container(
                      height: 50,
                      width: size.width * 0.30,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[350],
                            blurRadius: 5.0,
                            spreadRadius: 1,
                          ),
                        ],
                        //Color and text Changed selectedindex == index ? white: black ok
                        color: data.selectedIndex == index
                            ? Color(0xff323335)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(list[index]["images"]),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              list[index]["text"],
                              style: GoogleFonts.acme(
                                  color: data.selectedIndex == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
    );
  }

  Widget dataFav(BuildContext context, String collections) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.32,
      width: size.width,
      color: Colors.transparent,
      child: FutureBuilder(
          future: Provider.of<ManageData>(context, listen: false)
              .fetchData(collections),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child:
                    Lottie.asset("animation/47392-delivery-man-with-bike.json"),
              );
            }
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: DetailScreen(
                              queryDocumentSnapshot: snapshot.data[index],
                            ),
                          ));
                      // Provider.of<Headers>(context, listen: false)
                      //     .selectedIndex = index;
                    },
                    child: Consumer<Headers>(
                      builder: (context, data, child) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.5,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[300],
                                        blurRadius: 10,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Material(
                                        shape: CircleBorder(),
                                        clipBehavior: Clip.antiAlias,
                                        elevation: 10,
                                        child: Image.network(
                                          snapshot.data[index].data()['image'],
                                          height: 90,
                                          width: 90,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        snapshot.data[index].data()['text'],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.libreBaskerville(
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "★",
                                            style: TextStyle(
                                                color: Colors.yellow,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            snapshot.data[index]
                                                .data()['rating'],
                                            style: GoogleFonts.libreBaskerville(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "\$",
                                            style: GoogleFonts.workSans(
                                                color: Colors.green,
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            snapshot.data[index]
                                                .data()['ruppes'],
                                            style: GoogleFonts.questrial(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 155, top: 12),
                              child: Icon(
                                Icons.favorite,
                                color: data._selectedIndex == index
                                    ? Colors.red
                                    : Colors.blue,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                });
          }),
    );
  }

  Widget dataBusiness(BuildContext context, String collection) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 200,
      width: size.width,
      child: FutureBuilder(
        future: Provider.of<ManageData>(context, listen: false)
            .fetchData("Business"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  Lottie.asset("animation/47392-delivery-man-with-bike.json"),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Consumer<ManageData>(
                  builder: (context, data, child) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 10,
                              ),
                            ]),
                        height: 130,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                snapshot.data[index].data()['images'],
                                height: 90,
                                width: 90,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    snapshot.data[index].data()["title"],
                                    style: GoogleFonts.kronaOne(
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    snapshot.data[index].data()["subtitle"],
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Pizza",
                                    style: GoogleFonts.comfortaa(
                                        letterSpacing: 2,
                                        color: Colors.lightBlueAccent,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Text("\$",
                                          style: GoogleFonts.questrial(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 2,
                                            fontSize: 15,
                                            color: Colors.lightBlueAccent,
                                          )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        snapshot.data[index].data()["disc"],
                                        style: GoogleFonts.comfortaa(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          letterSpacing: 2,
                                          color: Colors.lightBlueAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text("\$",
                                          style: GoogleFonts.questrial(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 2,
                                            fontSize: 15,
                                            color: Colors.green,
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        snapshot.data[index].data()["ruppes"],
                                        style: GoogleFonts.questrial(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2,
                                          fontSize: 20,
                                          color: Colors.black,
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
                  },
                );
              });
        },
      ),
    );
  }
}
