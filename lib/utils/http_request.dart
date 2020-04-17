library http_request;

import 'package:covid_19/config.dart' as Config;
import 'package:http/http.dart' as http;

enum HttpMethod { get, post }

class BaseHttpRequest {
  BaseHttpRequest(this.httpMethod,
      {this.baseUrl = Config.apiUrl,
      this.body = const {},
      this.header = const {
        "x-rapidapi-host": Config.apiHost,
        "x-rapidapi-key": Config.apiKey
      },
      this.getParams = const {}});

  final HttpMethod httpMethod;
  final String baseUrl;
  final Map<String, String> body;
  final Map<String, String> header;
  final Map<String, String> getParams;
}

class GetRequest extends BaseHttpRequest {
  GetRequest({Map<String, String> getParams = const {}})
      : super(HttpMethod.get, getParams: getParams);

  String transformGetParam(Map<String, String> inputParam) {
    String getUrl = "?";
    inputParam.forEach((k, v) {
      getUrl += "$k=$v&";
    });
    return getUrl;
  }

  Future<String> getRequest(String slug) async {
    http.Response response = await http.get(
        this.baseUrl + slug + transformGetParam(getParams),
        headers: header);
    return response.body;
  }
}
