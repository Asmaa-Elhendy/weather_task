import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:weather_app/model/weather_model.dart';
import 'package:location/location.dart';
 class WeatherController{


  static var ApiKey='cab7769d2b820a4f227e9d40f623edfb';
  Location location=Location();

 static getWeather(String cityname)async{
  var res = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=${ApiKey}'),
     );
  var resbody = jsonDecode(res.body);
  print(resbody);
  if(res.statusCode==404){
    return null;
  }else{
    Weather weather=Weather(lat: resbody['coord']['lat'].toString(), long:  resbody['coord']['lon'].toString(),
        temp: resbody['main']['temp'].toString(),
        mainDescription: resbody['weather'][0]['main'].toString(), minTemp: resbody['main']['temp_min'].toString(),
        maxTemp: resbody['main']['temp_max'].toString(),name: resbody['name']);

  return weather;
}}


  requestPermissionLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;


    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    LocationData _locationData;
    _locationData = await location.getLocation();
    if( _locationData!=null){
      return [_locationData.latitude,_locationData.longitude];
    }else{
      return null;
    }

    }

  static getWeatherbyLocation(lat,long)async{
    var res = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=${ApiKey}'),
    );
    var resbody = jsonDecode(res.body);
    print(resbody);
    if(res.statusCode==404){
      return null;
    }else{
      Weather weather=Weather(lat: resbody['coord']['lat'].toString(), long:  resbody['coord']['lon'].toString(),
          temp: resbody['main']['temp'].toString(),
          mainDescription: resbody['weather'][0]['main'].toString(), minTemp: resbody['main']['temp_min'].toString(),
          maxTemp: resbody['main']['temp_max'].toString(),name: resbody['name']);

      return weather;
    }}

  }







