import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherinfo = await weatherModel.giveData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData: weatherinfo,
      );
    }));
  }

  // void getData() async {
  //   Response response = await get(Uri.http(
  //       "api.openweathermap.org", "/data/2.5/weather", {
  //     "lat": "32",
  //     "lon": "139",
  //     "appid": "1302ff7f540c6064921966417766d3e5"
  //   }));
  //   print(response.body);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitFadingFour(
        color: Colors.white,
        size: 100,
      )),
    );
  }
}
