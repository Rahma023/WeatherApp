import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/weather_cubit.dart';
import 'package:flutter_application_1/pages/weather_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) =>WeatherCubit(FakeWeatherRepository()),
        child: WeatherSearchPage(),
      ),
    );
  }
}

  

  // class MyChangeNifier extends ChangeNotifier{
  //   int field1;
  //   String field2;

  //   void changeState(){
  //     field2 ="New value";
  //     notifyListeners();
  //   }
  // }

  // class MyState{
  //   final int field1;
  //   final String field2;

  //   MyState(this.field1, this.field2);
    
  //   //ensure to add hashcode and orrides
  // }


  // class MyCubit extends Cubit<MyState>{
  //   MyCubit():super(MyState(0,'Initial value'));

  //   void changeState(){
  //     emit(MyState(0, 'New value'));
  //   }

  // }