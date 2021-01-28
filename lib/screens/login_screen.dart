import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
              child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                  child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress, 
                onChanged: (value) {
                  email = value; 
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                onPressed: () async {
                  setState(() {
                    showSpinner = true; 
                  }); 
                try{
                   UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
                   if(userCredential != null){
                     Navigator.pushNamed(context,'chat_screen');
                   }  
                   setState(() {
                     showSpinner = false;
                   });
               } on FirebaseAuthException catch (e){
                 if(e.code == 'user-not-found'){
                   print('No user found for that email');
                   } else if(e.code == 'wrong-password'){
                     print('Wrong password provided for that user');
                   }
               }
                },
              color: Colors.lightBlueAccent,text: 'Log In',),
            ],
          ),
        ),
      ),
    );
  }
}