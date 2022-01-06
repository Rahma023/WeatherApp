import 'dart:math';
// import 'model/weather.dart';
import 'weather.dart';

abstract class WeatherRepository{
  // ignore: non_constant_identifier_names, prefer_typing_uninitialized_variables
//  [NetworkException;]
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository{
  @override 
  Future<Weather> fetchWeather(String cityName){
    //simulate network delay
    return Future.delayed(
      Duration(seconds: 1),
      (){
        final random=Random();
        //simulate some network eception
        if(random.nextBool()){
          throw NetworkException();
        }
        //returned fetched weather
        return Weather(cityName: cityName,
        //temp btween 20 and 35.99
        temperatureCelsius: 20+random.nextInt(15)+random.nextDouble(),
        
        );
      },
    );
  }

  @override
  var NetworkException;
}

class NetworkException implements Exception{}