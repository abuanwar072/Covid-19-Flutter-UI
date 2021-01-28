import 'package:flutter/material.dart';
import 'package:covid_19/widgets/rounded_button.dart';
import 'package:covid_19/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}
class _RegistrationScreenState extends State<RegistrationScreen> {

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
                    final UserCredential newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                    if(newUser != null){
                      Navigator.pushNamed(context, 'chat_screen');
                        }
                        setState(() {
                          showSpinner = false;
                        });
                    }
                catch(e){
                  print(e);

                }
              },
              color: Colors.lightBlueAccent,text: 'Register',),
            ],
          ),
        ),
      ),
    );
  }
}