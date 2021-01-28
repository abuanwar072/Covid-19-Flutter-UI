import 'package:flutter/material.dart';
import 'package:covid_19/widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {

  AnimationController controller;
  AnimationController controller2;
  Animation animation;
  Animation animation2;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration:  Duration(seconds: 2),
      vsync: this,
    );
    controller2 = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
    controller2.forward();
    animation = ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);

    animation2 = CurvedAnimation(parent: controller2, curve: Curves.easeInOutQuint);

    controller.addListener((){
      setState(() {});
    });
    controller2.addListener((){
      setState(() {});
    });
  }
  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    height: animation2.value*50,
                  ),
                ),
               Text(
             'Covid_Visualizer',
                 style: TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.w900,),
               ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(text: 'Log In', color: Colors.lightBlueAccent,onPressed: (){Navigator.pushNamed(context,'login_screen');},),
            RoundedButton(text: 'Register',color: Colors.blueAccent,onPressed: (){
              Navigator.pushNamed(context,'registration_screen');
            },)
          ],
        ),
      ),
    );
  }
}