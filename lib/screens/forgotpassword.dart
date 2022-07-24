import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:deus_vult/utils/my_navigator.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();

  @override
  void dispose(){
    emailcontroller.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text('Reset Password'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Receive an E-mail to\n reset your password',
            textAlign : TextAlign.center,
            style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailcontroller,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp("[0-9a-zA-Z@.]")),
                        ],
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            icon: Icon(Icons.email_outlined),
            label: Text(
              'Reset Password',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: (){
              forgotPassword();
            },
            ),
          ],
        ),
      ),
    ),
  );

  Future forgotPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );


    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontroller.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text( "Reset Password mail sent"),));
    //navigator of context not working
    //Navigator.currentState!.popUntil((route) => route.isFirst);
    Navigator.of(context).popUntil((route) => route.settings.name == "login");
    } on FirebaseAuthException catch(e){
      //print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message!),));
      Navigator.of(context).pop();
    }
  }
   //add a toat message or snackbar(bottom) password rened to mail.
   //add lines
   
}