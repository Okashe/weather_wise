import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

// class ApiRequestHelper {
//   String url = 'api.openweathermap.org';
//   String endpoint = '/data/2.5/weather';
//   String apiKey = 'bdfe5df222bf529eb2d880c4e4159595';
//   double? latitude;
//   double? longitude;
//   Location location = Location();

//   void getLocation() async {
//     Location location = Location();
//     await location.getCurrentLocation();
//     latitude = location.latitude;
//     longitude = location.longitude;
//   }

//   Future<dynamic> fetchWeatherData() async {
//     var requestData = Uri.https(
//         url, endpoint, {'lat': '33.44', 'lon': '-94.04', 'appid': apiKey});
//     http.Response response = await http.get(requestData);
//     if (response.statusCode == 200) {
//       String data = response.body;
//       var decodedData = jsonDecode(data);
//       var longitude = decodedData['coord']['lon'];
//       print(longitude);
//       var temperature = decodedData['main']['temp'];
//       var condition = decodedData['weather'][0]['id'];
//       var city = decodedData['name'];
//       var weatherDescription = decodedData['weather'][0]['description'];
//       print(weatherDescription);
//       print(temperature);
//       print(condition);
//       print(city);
//     } else {
//       print(response.statusCode);
//     }
//   }
// }
