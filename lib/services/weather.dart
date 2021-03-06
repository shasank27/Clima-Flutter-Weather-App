import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const String key = '1302ff7f540c6064921966417766d3e5';

class WeatherModel {
  Future<dynamic> giveCityData(String city) async {
    Network network = Network();
    var getData = await network.getData(
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$key&units=metric');
    return getData;
  }

  Future<dynamic> giveData() async {
    Network network = Network();
    Location location = Location();
    await location.getMyLocation();
    var getData = await network.getData(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$key&units=metric');
    return getData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
