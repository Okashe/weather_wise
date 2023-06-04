import 'package:flutter/material.dart';
import 'package:weather_wise/services/location.dart';
import 'package:weather_wise/services/networking.dart';
import 'package:weather_wise/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

String apiKey = 'bdfe5df222bf529eb2d880c4e4159595';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Location location = Location();

  @override
  //this enables to print long and lat everytime you restart the app without tapping on the button
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    // latitude = location.latitude;
    // longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    Navigator.push((context), MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  // double temperature = decodedData['main']['temp'];
  // int condition = decodedData['weather'][0]['id'];
  // String city = decodedData['name'];

  // print(temperature);
  // print(condition);
  // print(city);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
