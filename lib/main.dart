import 'package:flutter/material.dart';
import 'package:deus_vult/screens/home.dart';
import 'package:deus_vult/screens/intro.dart';
import 'package:deus_vult/screens/splash.dart';
import 'package:deus_vult/screens/register.dart';
import 'package:deus_vult/screens/login.dart';
import 'package:deus_vult/screens/otp.dart';

var routes = <String, WidgetBuilder>{
  "home": (BuildContext context) => Home(),
  "intro": (BuildContext context) => IntroScreen(),
  'register': (context) => Register(),
  'login': (context) => Login(),
  'otp': (context) => OTP(),
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));
