import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/weather_cubit.dart';
//import 'package:flutter_application_1/ios/model/weather.dart';


class WeatherSearchPage extends StatefulWidget{
  @override
  _WeatherSearchPageState createState()=>_WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Search"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: bloclistener(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: blocconsumer<WeatherCubit, WeatherState>(
            Listener: (context, state){
              if(state is WeatherError){
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),

                );
              }
            },
          builder: (context, state){
            if(state is WeatherInitial){
              return buildInitialInput();
            }
            else if(state is WeatherLoading){
              return WeatherLoading();
            }
            else if(state is WeatherLoaded){
              return buildColumnWithData(state.weather);
            }
            //if state is weatherError
            else{
              return buildInitialInput();

            }
          },
        ),
      ),
    ),
    );
  }

  Widget buildInitialInput(){
    return Center(
      child: cityInputField(),
    );
  }

  WidgetbuildLoading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Weather, weather){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),

        Text(
          //displays temp with 1 decimal place
          "${weather.temperatureCelsius.toStringAsFixed(1)} c",
          style: TextStyle(fontSize: 80),
        ),
        cityInputField(),

      ],
    );
  }
}

class cityInputField extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
         // suffixIcon: Icon(Icons.search),
          ),
        ),

      ),
      
    );

    // ignore: dead_code
    void submitCityName(BuildContext context, String cityName){
      final WeatherInitial=context.Bloc<WeatherCubit>();
      WeatherCubit.getWeather(cityName);

    }
  }
}