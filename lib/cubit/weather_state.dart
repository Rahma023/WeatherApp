part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();

}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded(this.weather);

  @override
  bool operator==(Object o){
    if(identical(this,o)) return true;

    return o is WeatherLoaded && o.weather==weather;
  }

@override
int get hashcode => weather.hashCode;
}


class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  bool operator==(Object o){
    if(identical(this,o)) return true;

    return o is WeatherLoaded && o.weather==message;
  }

@override
int get hashcode => message.hashCode;
}

