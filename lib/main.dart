import 'package:covid_19/constant.dart';
import 'package:covid_19/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/screens/home_screen.dart';
import 'package:covid_19/screens/see_details.dart';
import 'package:covid_19/screens/welcome_screen.dart';
import 'package:covid_19/screens/registration_screen.dart';
import 'package:covid_19/screens/login_screen.dart';
import 'package:covid_19/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            bodyText2: TextStyle(color: kBodyTextColor),
          )
          ),
      initialRoute: 'home_screen',
      routes: {
        'home_screen' : (context) => HomeScreen(),
        'info_screen' : (context) => InfoScreen(),
        'see_details' : (context) => SeeDetails(),
        'welcome_screen' : (context) => WelcomeScreen(),
        'registration_screen' : (context) => RegistrationScreen(),
        'login_screen' : (context) => LoginScreen(), 
        'chat_screen' : (context) => ChatScreen()
      },
    );
  }
}

