import 'package:http/http.dart' as http;
import 'dart:convert';

main() {
  getData();
}

ApiRequestHelper reqWeatherData = ApiRequestHelper();

void getData() async {
  var res = await reqWeatherData.fetchWeatherData();
  print(res);
}

class ApiRequestHelper {
  String url = 'api.openweathermap.org';
  String endpoint = '/data/2.5/weather';
  String apiKey = 'bdfe5df222bf529eb2d880c4e4159595';

  Future<dynamic> fetchWeatherData() async {
    var requestData = Uri.https(
        url, endpoint, {'lat': '33.44', 'lon': '-94.04', 'appid': apiKey});
    http.Response response = await http.get(requestData);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return 'request failed';
  }
}
