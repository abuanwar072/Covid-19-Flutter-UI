import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Data {
  List<String> countries = [];
  List<CountryData> countryData;

}

class CountryData {
  int updated;
  String country;
  CountryInfo countryInfo;
  int cases;     //d
  int todayCases;  //d
  int deaths;          //done
  int todayDeaths;    //d 
  int recovered;       //done
  int todayRecovered; //d
  int active; //done 
  int critical; //d 
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int tests; // d 
  int testsPerOneMillion;
  int population;
  String continent;
  int oneCasePerPeople;
  int oneDeathPerPeople;
  int oneTestPerPeople;
  double activePerOneMillion;
  double recoveredPerOneMillion;
  double criticalPerOneMillion;

  CountryData(
      {
        this.updated,
        this.country,
        this.countryInfo,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.todayRecovered,
        this.active,
        this.critical,
        this.casesPerOneMillion,
        this.deathsPerOneMillion,
        this.tests,
        this.testsPerOneMillion,
        this.population,
        this.continent,
        this.oneCasePerPeople,
        this.oneDeathPerPeople,
        this.oneTestPerPeople,
        this.activePerOneMillion,
        this.recoveredPerOneMillion,
        this.criticalPerOneMillion
        }
        );



  CountryData.fromJson(Map<String, dynamic> json) {
    updated = json['updated'];
    country = json['country'];
    countryInfo = json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null;
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    todayRecovered = json['todayRecovered'];
    active = json['active'];
    critical = json['critical'];
    casesPerOneMillion = json['casesPerOneMillion'];
    deathsPerOneMillion = json['deathsPerOneMillion'].toInt();
    tests = json['tests'];
    testsPerOneMillion = json['testsPerOneMillion'];
    population = json['population'];
    continent = json['continent'];
    oneCasePerPeople = json['oneCasePerPeople'];
    oneDeathPerPeople = json['oneDeathPerPeople'];
    oneTestPerPeople = json['oneTestPerPeople'];
    activePerOneMillion = json['activePerOneMillion'].toDouble();
    recoveredPerOneMillion = json['recoveredPerOneMillion'].toDouble();
    criticalPerOneMillion = json['criticalPerOneMillion'].toDouble();
  }


}

class CountryInfo {
  int iId;
  String iso2;
  String iso3;
  double lat;
  double long;
  String flag;

  CountryInfo({this.iId, this.iso2, this.iso3, this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    flag = json['flag'];
  }

}
