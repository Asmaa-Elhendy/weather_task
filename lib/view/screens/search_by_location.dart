import 'package:flutter/material.dart';
import 'package:weather_app/controller/save_location_local.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/view/screens/weather_details.dart';
import 'package:weather_app/view/widgets/utilities.dart';
import '../../model/weather_model.dart';
import 'package:location/location.dart';

class SearchByLocation extends StatefulWidget {
  const SearchByLocation({Key? key}) : super(key: key);

  @override
  State<SearchByLocation> createState() => _SearchByLocationState();
}

class _SearchByLocationState extends State<SearchByLocation> {
  static final _formKey = GlobalKey<FormState>();
  String lat = '';
  String long = '';
  Location location = new Location();
  bool islocation = false;
  var color = const Color(0xff6c63ff);
  final TextEditingController citycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: height * .1,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Color(0xff6c63ff),
                    ),
                    Center(
                        child: Text(
                      'Get weather by city location',
                      style: TextStyle(
                          color: Color(0xff6c63ff),
                          fontWeight: FontWeight.bold,
                          fontSize: width * .054),
                    )),
                  ],
                ),
                Image.asset("assets/images/weather.png"),
                InkWell(
                    onTap: () async {
                      var location =
                          await WeatherController().requestPermissionLocation();
                      setState(() {
                        if (location == null) {
                          islocation = false;
                        } else {
                          islocation = true;
                          LocalStore().saveLocation(lat, long);
                          lat = location[0].toString();
                          long = location[1].toString();

                        }
                      });
                    },
                    child: homeButton(width, height, 'Tap to Get my location')),
                SizedBox(
                  height: height * .03,
                ),
                islocation
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('lat: ${lat}',
                              style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * .04)),
                          Text('long: ${long}',
                              style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: width * .04)),
                        ],
                      )
                    : SizedBox(),
                SizedBox(height: height * .05),
                islocation
                    ? RaisedButton(
                        onPressed: () async {
                          Weather? weather =
                              await WeatherController.getWeatherbyLocation(
                                  lat, long);
                          print('weather $weather');
                          weather == null
                              ? showsnack(context, 'City not found !!')
                              : Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => WeatherDetails(
                                        weather: weather,
                                      )));
                          citycontroller.clear();
                        },
                        child: const Text(
                          'Tap to get weather of my location',
                          style: TextStyle(color: Color(0xff6c63ff)),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
