import 'dart:math';
// import 'model/weather.dart';
import 'weather.dart';

abstract class WeatherRepository{
//  [NetworkException;]
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository{
  @override 
  Future<Weather> fetchWeather(String cityName){
    return Future.delayed(
      Duration(seconds: 10),
      (){
        final random=Random();
        if(random.nextBool()){
          throw NetworkException();
        }
        return Weather(cityName: cityName,
        temperatureCelsius: 20+random.nextInt(15)+random.nextDouble(),
        
        );
      },
    );
  }

  @override
  var NetworkException;
}

class NetworkException implements Exception{}