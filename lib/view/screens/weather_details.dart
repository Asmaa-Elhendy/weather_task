import 'package:flutter/material.dart';
import '../../model/weather_model.dart';
import '../widgets/utilities.dart';

class WeatherDetails extends StatelessWidget {
  Weather? weather;

  WeatherDetails({required this.weather});

  var color = const Color(0xff6c63ff);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus;
        currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: Text('Weather Details'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: height * .05,
                  ),
                  Image.asset("assets/images/weather.png"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('lat: ${weather!.lat}',
                          style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w500,
                              fontSize: width * .04)),
                      Text('long: ${weather!.long}',
                          style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w500,
                              fontSize: width * .04)),
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text(weather!.mainDescription,
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: width * .07)),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text(weather!.temp,
                      style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: width * .07)),
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Min Temp ${weather!.minTemp}',
                          style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w500,
                              fontSize: width * .04)),
                      Text('Max Temp ${weather!.maxTemp}',
                          style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w500,
                              fontSize: width * .04)),
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: homeButton(width, height, 'Search again'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
