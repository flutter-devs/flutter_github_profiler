import 'package:flutter/material.dart';
import 'package:github_flutter_ui/HomePage.dart';
import 'package:github_flutter_ui/login_screen.dart';
import 'package:github_flutter_ui/splash/splash_screens.dart';
import 'package:github_flutter_ui/Constant/Constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: <String,WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context)=> AnimatedSplashScreen(),
        HOME_SCREEN: (BuildContext context)=> Login(),
      },
      home: AnimatedSplashScreen(),
    );
  }
}
