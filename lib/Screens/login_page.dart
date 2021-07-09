import 'package:Food_Delivery/Screens/home_page.dart';
import 'package:Food_Delivery/Services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.green.shade400,
                    onPressed: () {
                      loginBottomSheet(context);
                    },
                    child: Text(
                      "Log In",
                      style: GoogleFonts.almarai(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.red.shade400,
                    onPressed: () {
                      signBottomSheet(context);
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.almarai(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            width: 300,
            color: Colors.grey.shade400,
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: emailController,
                      //obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      height: 40,
                      minWidth: 200,
                      color: Colors.red.shade300,
                      onPressed: () {
                        loginUser(emailController.text, passwordController.text,
                            context);
                      },
                      // onPressed: () {
                      //   Provider.of<loginAuth>(context).registerWithEmailPassword(
                      //           emailController.text, passwordController.text)
                      //       .whenComplete(() {
                      //     Navigator.pushReplacement(
                      //         context,
                      //         PageTransition(
                      //             child: HomeScreen(),
                      //             type: PageTransitionType.bottomToTop));
                      //   });
                      // },
                      child: Text(
                        "Log In",
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  signBottomSheet(BuildContext context) {
    final TextEditingController first = TextEditingController();
    final TextEditingController last = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(),
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: first,
                      //obscureText: true,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "First Name",
                        prefixIcon: Icon(
                          Icons.account_circle_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextField(
                      controller: last,
                      //obscureText: true,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Last Name",
                        prefixIcon: Icon(
                          Icons.approval,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextField(
                      controller: email,
                      //obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextField(
                      controller: password,
                      obscureText: true,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      height: 40,
                      minWidth: 200,
                      color: Colors.green.shade300,
                      onPressed: () {
                        // final close = context.showLoading();
                        registerUser(email.text, password.text, context);
                      },
                      // onPressed: () {
                      //   Provider.of<>(context)
                      //       .loginUser(
                      //           emailController.text, passwordController.text)
                      //       .whenComplete(() {
                      //     Navigator.pushReplacement(
                      //         context,
                      //         PageTransition(
                      //             child: HomeScreen(),
                      //             type: PageTransitionType.bottomToTop));
                      //   });
                      // },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void registerUser(String email, String password, context) async {
    LoginAuthentication authentication =
        Provider.of<LoginAuthentication>(context, listen: false);
    try {
      if (await authentication.createUserAuth(email, password)) {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: LoginPage(), type: PageTransitionType.bottomToTop));
      }
    } catch (e) {
      print(e);
    }
  }

  void loginUser(String email, String password, context) async {
    LoginAuthentication loginAuthentication =
        Provider.of<LoginAuthentication>(context, listen: false);
    try {
      if (await loginAuthentication.signUserAuth(email, password)) {
        Navigator.pushReplacement(
            context,
            PageTransition(
                child: HomeScreen(), type: PageTransitionType.topToBottom));
      }
    } catch (e) {
      print(e);
    }
  }
}
