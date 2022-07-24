import 'package:flutter/material.dart';
import 'package:deus_vult/screens/home.dart';
import 'package:deus_vult/screens/intro.dart';
import 'package:deus_vult/screens/splash.dart';
import 'package:deus_vult/screens/register.dart';
import 'package:deus_vult/screens/login.dart';
import 'package:deus_vult/screens/otp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:deus_vult/provider/google_signin.dart';
import 'package:provider/provider.dart';

var routes = <String, WidgetBuilder>{
  "home": (BuildContext context) => Home(),
  "intro": (BuildContext context) => IntroScreen(),
  'register': (context) => Register(
        onclickedSignIn: () {},
      ),
  'login': (context) => Login(),
  'otp': (context) => OTP(),
};

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
            navigatorKey: navigatorKey,
            theme: ThemeData(
                primaryColor: Colors.red, accentColor: Colors.yellowAccent),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            routes: routes),
      );
}
