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
  GetRequest() : super(HttpMethod.get);

  Future<Response> getRequest(String slug) {
    var response = http.get(this.baseUrl + slug, headers: header);
    return response;
  }
}
