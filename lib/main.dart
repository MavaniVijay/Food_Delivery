import 'package:Food_Delivery/Helpers/headers.dart';
import 'package:Food_Delivery/Screens/splash_screen.dart';
import 'package:Food_Delivery/Services/authentication.dart';
import 'package:Food_Delivery/Services/calculation.dart';
import 'package:Food_Delivery/Services/mange_data.dart';
import 'package:Food_Delivery/Services/map.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Calculation(),
        ),
        ChangeNotifierProvider.value(
          // child: LoginPage(),
          value: LoginAuthentication(),
        ),
        ChangeNotifierProvider.value(
          value: Headers(),
        ),
        ChangeNotifierProvider.value(
          value: ManageData(),
        ),
        ChangeNotifierProvider.value(
          value: Map(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
