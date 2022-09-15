import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/view/screens/search_by_city.dart';
import 'package:weather_app/view/screens/search_by_location.dart';
import 'package:weather_app/view/widgets/utilities.dart';

import '../widgets/drawer.dart';


class Home extends StatelessWidget {

  var color = const Color(0xff6c63ff);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DrawerPage(),
      body: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: width*.03,top: height*.05),
                child: IconButton(onPressed: (){
                  Scaffold.of(context).openDrawer();
                },
                  icon:Icon(Icons.menu),color: color,iconSize: width*.1,),
              ),
              Center(
                child: Column(children: [
                  SizedBox(height: height*.06,),

                  Text('Weather App',style: TextStyle(color:  Color(0xff6c63ff),fontWeight: FontWeight.bold,fontSize: width*.07),),
                  SizedBox(height: height*.03,),
                  Image.asset("assets/images/weather.png"),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchByLocation()));
                    },
                    child: homeButton(width, height, 'Get weather by location')
                  ),   SizedBox(height: height*.08,),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchByCity()));
                      },
                      child: homeButton(width, height, 'Get weather manually')
                  )
                ],),
              ),
            ],
          );
        }
      ),
    );
  }
}
