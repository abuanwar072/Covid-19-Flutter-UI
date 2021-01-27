import 'package:covid_19/constant.dart';
import 'package:covid_19/screens/see_details.dart';
import 'package:covid_19/widgets/counter.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _timeString;
  final controller = ScrollController();
  CountryData currentSelectedCountry;
  double offset = 0;
  bool loading = true;
  Data data;


  Future<void> getAllData() async {
    List<CountryData> allCountryData;
    var response = await http.get("https://disease.sh/v3/covid-19/countries?yesterday=true&twoDaysAgo=true");
    allCountryData = (json.decode(response.body) as List).map((i) =>
        CountryData.fromJson(i)).toList();
    data = Data();
    data.countryData = allCountryData;
    allCountryData.forEach((element) {
      data.countries.add(element.country);
    });
    currentSelectedCountry = data.countryData.firstWhere((element) => element.country=="Pakistan");
    _getTime();
    loading = false;

  }



  @override
  void initState() {
    
    super.initState();
    controller.addListener(onScroll);
    getAllData();
  }

  @override
  void dispose() {
    
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  void _getTime() {
    final String formattedDateTime = DateFormat.yMd().add_jm().format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //yaha data load horha hai modification krni hai for ui
            body: !loading ? RefreshIndicator(
              onRefresh: () async {
                await getAllData();

              },
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: <Widget>[
                    MyHeader(
                      image: "assets/icons/Drcorona.svg",
                      textTop: "All you need",
                      textBottom: "is stay at home.",
                      offset: offset,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Color(0xFFE5E5E5),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                          SizedBox(width: 20),
                          Expanded(
                            child: DropdownButton(
                              isDense: true,
                              isExpanded: true,
                              underline: SizedBox(),
                              icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                              value: currentSelectedCountry.country,
                              items: data.countries.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  currentSelectedCountry = data.countryData.firstWhere((element) => element.country==value);
                                 
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Case Update\n",
                                      style: kTitleTextstyle,
                                    ),
                                    TextSpan(
                                      text: _timeString.toString(), //   get date/time here
                                      style: TextStyle(
                                        color: kTextLightColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: (){
                                  print('see details');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SeeDetails(currentSelectedCountry: currentSelectedCountry,),
                                      )
                                  );
                                },
                                  child: Text(
                                  "See details",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Counter(
                                  color: kInfectedColor,
                                  number: NumberFormat.compact().format(currentSelectedCountry.active),
                                  title: "Infected",
                                ),
                                Counter(
                                  color: kDeathColor,
                                  number: NumberFormat.compact().format(currentSelectedCountry.deaths),
                                  title: "Deaths",
                                ),
                                Counter(
                                  color: kRecovercolor,
                                  number: NumberFormat.compact().format(currentSelectedCountry.recovered),
                                  title: "Recovered",
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Spread of Virus",
                                style: kTitleTextstyle,
                              ),
                              Text(
                                "See details",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(20),
                            height: 178,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 30,
                                  color: kShadowColor,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "assets/images/map.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ) 
            : 
            Scaffold(
              backgroundColor: Colors.grey[700],
              body: Center(
                child: SpinKitDoubleBounce(size: 100.0,color: Colors.white,),
              ),
            ),
          );
  }
}
