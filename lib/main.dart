import 'package:custom_splash/custom_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:icarehotel/color.dart';
import 'package:icarehotel/mainpage.dart';

void main() async {
  Function duringSplash = () {
    return 1;
  };
  Map<int, Widget> op = {1: MyApp()};
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: CustomSplash(
      imagePath: 'assets/Logo.png',
      backGroundColor: ColorTheme.secondTheme,
      animationEffect: 'zoom-in',
      logoSize: 250,
      home: MyApp(),
      customFunction: duringSplash,
      duration: 2500,
      type: CustomSplashType.StaticDuration,
      outputAndHome: op,
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mainpage(),
    );
  }
}
