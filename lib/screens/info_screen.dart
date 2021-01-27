import 'dart:io';

import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/widgets/symtom_card.dart';
import 'package:covid_19/widgets/prevent_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Symtom{
  headache,
  cough,
  fever,
  breath,
  chest,
  smell,
  tired,

}

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  List<int> listOfSymtoms = [0,0,0,0,0,0,0];
  int chanceOfCovid = 0;

  int selectedIndex = 0;

  Color headacheCardColor = kInActiveCardColor;
  Color feverCardColor = kInActiveCardColor;
  Color coughCardColor = kInActiveCardColor;
  Color breathCardColor = kInActiveCardColor;
  Color chestCardColor = kInActiveCardColor;
  Color smellCardColor = kInActiveCardColor;
  Color tiredCardColor = kInActiveCardColor;

    void getCovidChance(){
      chanceOfCovid = 0;
      if(listOfSymtoms[0] == 1){
        chanceOfCovid += 10;
        }
      if(listOfSymtoms[1] == 1){
        chanceOfCovid +=20;
      }
      if(listOfSymtoms[2] == 1){
        chanceOfCovid +=10;
      }
      if(listOfSymtoms[3] == 1){
        chanceOfCovid +=20;
      }
      if(listOfSymtoms[4] == 1){
        chanceOfCovid +=10;
      }
      if(listOfSymtoms[5] == 1){
        chanceOfCovid +=20;
      }
      if(listOfSymtoms[6] == 1){
        chanceOfCovid +=5;
      }
  }

  void updateColor(Symtom selectedSymtom){
    if(selectedSymtom == Symtom.headache){
      if(headacheCardColor == kInActiveCardColor){
        headacheCardColor = kActiveShadowColor;
        listOfSymtoms[0] = 1;
      }
      else{
        headacheCardColor = kInActiveCardColor;
        listOfSymtoms[0] = 0;
      }

    }
    if(selectedSymtom == Symtom.cough){
      if(coughCardColor == kInActiveCardColor){
        coughCardColor = kActiveShadowColor;
        listOfSymtoms[1] = 1;
      }
      else {
        coughCardColor = kInActiveCardColor;
        listOfSymtoms[1] = 0;
      }
    }

    if(selectedSymtom == Symtom.fever){
      if(feverCardColor == kInActiveCardColor){
        feverCardColor = kActiveShadowColor;
        listOfSymtoms[2] = 1;
      }
      else {
        feverCardColor = kInActiveCardColor;
         listOfSymtoms[2] = 0;
      }
    }
    if(selectedSymtom == Symtom.breath){
      if(breathCardColor == kInActiveCardColor){
        breathCardColor = kActiveShadowColor;
         listOfSymtoms[3] = 1;
      }
      else {
        breathCardColor = kInActiveCardColor;
         listOfSymtoms[3] = 0;
      }
    }
    if(selectedSymtom == Symtom.chest){
      if(chestCardColor == kInActiveCardColor){
        chestCardColor = kActiveShadowColor;
         listOfSymtoms[4] = 1;
      }
      else {
        chestCardColor = kInActiveCardColor;
          listOfSymtoms[4] = 0;
      }
    }
    if(selectedSymtom == Symtom.smell){
      if(smellCardColor == kInActiveCardColor){
        smellCardColor = kActiveShadowColor;
         listOfSymtoms[5] = 1;
      }
      else {
        smellCardColor = kInActiveCardColor;
         listOfSymtoms[5] = 0;
      }
    }
    if(selectedSymtom == Symtom.tired){
      if(tiredCardColor == kInActiveCardColor){
        tiredCardColor = kActiveShadowColor;
         listOfSymtoms[6] = 1;
      }
      else {
        tiredCardColor = kInActiveCardColor;
         listOfSymtoms[6] = 0;
      }
    }
  }


  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
        Container(
    decoration: BoxDecoration(
      color: Colors.blue[600],
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.0),
        topLeft: Radius.circular(20.0)
      ),
    ),
      height: 60,
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context,'welcome_screen');
        },
        child: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
              
                flex: 8,
                 child: Padding(
                   padding: const EdgeInsets.only(
                     left: 35.0,
                    
                   ),
                   child: Text(
                    'Chat with Doctor',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                 ),
              ),
              Expanded(
                flex: 4,
                  child: Icon(
                  Icons.messenger_outline_rounded,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
              
            ],
          ),
        ),
      ),
    ),
body: SingleChildScrollView(
    controller: controller,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyHeader(
          image: "assets/icons/coronadr.svg",
          textTop: "Get to know if",
          textBottom: "you have Covid.",
          offset: offset,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Symptoms",
                style: kTitleTextstyle,
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(Symtom.headache);
                        });
                      },
                      child: SymptomCard(
                        image: "assets/images/headache.png",
                        title: "Headache",
                        isActive: true,
                        color: headacheCardColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(Symtom.cough);
                        });

                      },
                      child: SymptomCard(
                        image: "assets/images/caugh.png",
                        title: "Caugh",
                        isActive: false,
                        color: coughCardColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(Symtom.fever);
                        });

                      },
                      child: SymptomCard(
                        image: "assets/images/fever.png",
                        title: "Fever",
                        isActive: false,
                        color: feverCardColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(Symtom.breath);
                        });

                      },
                      child: SymptomCard(
                        image: "assets/images/headache.png",
                        title: "Shortness Of Breath",
                        color: breathCardColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {

                          updateColor(Symtom.chest);

                        });
                      },
                      child: SymptomCard(
                        image: "assets/images/caugh.png",
                        title: "Chest Pain",
                        color: chestCardColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(Symtom.smell);
                        });


                      },

                      child: SymptomCard(
                        image: "assets/images/fever.png",
                        title: "Loss of taste/smell",
                        color: smellCardColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(Symtom.tired);
                        });

                      },
                      child: SymptomCard(
                        image: "assets/images/headache.png",
                        title: "Tirediness",
                        color: tiredCardColor,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: GestureDetector(
                      onTap: (){
                         print(listOfSymtoms);
                        print('hahahaha');
                        setState(() {
                          getCovidChance();
                          });

                        },
                      child: Container(
                        height: 70.0,
                        child: Card(
                          semanticContainer: true,
                          child: Center(
                            child: Text(
                              
                              'Enter',
                              
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w300,


                              ),
                            ),
                          ),
                          elevation: 10.0,
                          color : Colors.blue[600],
                          margin: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),

                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 60.0,
                      child:
                      Center(
                        child: Text(
                          '$chanceOfCovid %',// calculate percentage and display
                          style:
                          TextStyle(
                            fontSize: 35.0,fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text("Prevention", style: kTitleTextstyle),
              SizedBox(height: 20.0),
              PreventCard(
                text:
                "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                image: "assets/images/wear_mask.png",
                title: "Wear face mask",
              ),
              PreventCard(
                text:
                "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                image: "assets/images/wash_hands.png",
                title: "Wash your hands",
              ),
              SizedBox(height: 50),
            ],
          ),
        )
      ],
    ),
        ),
      );
  }
}