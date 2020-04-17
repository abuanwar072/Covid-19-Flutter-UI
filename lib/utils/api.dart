library api;

import 'package:covid_19/utils/http_request.dart' as httpRequest;
import 'package:covid_19/model/statistic_model.dart';
import 'dart:convert';

class HomeApi {
  Future<Statistic> getStatistic(String country) async {
    Map<String, String> getParam = {"country": country};

    String response = await httpRequest.GetRequest(getParams: getParam)
        .getRequest('statistics');

    return Statistic.fromJson(json.decode(response));
  }

  Future<Countries> getCountries() async {
    String response = await httpRequest.GetRequest().getRequest('countries');

    return Countries.fromJson(json.decode(response));
  }
}
