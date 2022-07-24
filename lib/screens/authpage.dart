import 'package:deus_vult/screens/register.dart';
import 'package:deus_vult/widgets/loginWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? loginWidget(onclickedSignup: toggle)
      : Register(onclickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
