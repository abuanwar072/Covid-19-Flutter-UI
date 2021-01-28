import 'package:covid_19/data.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/counter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class SeeDetails extends StatefulWidget {

  final CountryData currentSelectedCountry;

  SeeDetails({this.currentSelectedCountry});

  @override
  _SeeDetailsState createState() => _SeeDetailsState();
}

class _SeeDetailsState extends State<SeeDetails> {

 

final controller = ScrollController();
 double offset = 0;

 @override
  void initState() {
    
    super.initState();
    controller.addListener(onScroll);
    
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Center(
          child: Text(
            'Extra Details',
          ),
        ),
      ),
      body:
          SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                     child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.cases),
                      color: Colors.blue,
                      title: "Total Cases",
                    ),
                  ),
                  Flexible(
                      child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.todayCases),
                      color: Colors.redAccent,
                      title: "Today Cases",
                    ),
                  ),
                  Flexible(
                      child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.todayDeaths),
                      color: Colors.amber,
                      title: "Today Deaths",
                    ),
                  ),
                ],
                ),
            ),
            Divider(
              color: Colors.grey[300],
              height: 4.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
              ),
           
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.todayRecovered),
                      color: Colors.blue,
                      title: "    Today\nRecovered",
                    ),
                  ),
                  Flexible(
                      child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.critical),
                      color: Colors.redAccent,
                      title: "Critical\nPatients",
                    ),
                  ),
                  Flexible(
                      child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.tests),
                      color: Colors.amber,
                      title: "TotalTests",
                    ),
                  ),
                ],
                ),
            ),
             Divider(
              color: Colors.grey[300],
              height: 4.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
              ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.casesPerOneMillion),
                      color: Colors.blue,
                      title: "C P O M",  //case per one million
                    ),
                  ),
                  Flexible(
                      child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.deathsPerOneMillion),
                      color: Colors.redAccent,
                      title: "D P O M", // death per one miilion
                    ),
                  ),
                  Flexible(
                      child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.testsPerOneMillion),
                      color: Colors.amber,
                      title: "T P O M", // test per one million
                    ),
                  ),
                ],
                ),
            ),
             Divider(
              color: Colors.grey[300],
              height: 4.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
              ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.activePerOneMillion),
                      color: Colors.blue,
                      title: "A P O M",  //case per one million
                    ),
                  ),
                  Flexible(
                      child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.recoveredPerOneMillion),
                      color: Colors.redAccent,
                      title: "R P O M", // death per one miilion
                    ),
                  ),
                  Flexible(
                     child: Counter(
                      number: NumberFormat.compact().format(widget.currentSelectedCountry.criticalPerOneMillion),
                      color: Colors.amber,
                      title: "C P O M", // test per one million
                    ),
                  ),
                ],
                ),
            ),
            SizedBox(height:30.0),
            Column(
              
              children: [
                Text(
                '* C P O M : Case Per One Million',
                ),
                Text(
                '* D P O M : Death Per One Milllion',
                ),
                Text(
                  '* T P O M : Test Per One Million',
                ),
                Text(
                  '* A P O M : Active Cases Per One Million', 
                ),
                Text(
                  '* R P O M : Recoverd Per One Million', 
                ),
                Text(
                  '* C P O M : Critical Per One Million',
                ),
              ],
              ),
            SizedBox(height: 30.0),

          ],
          
        ),
      ),
      
    );
  }
}