import 'package:flutter/material.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/view/screens/weather_details.dart';
import 'package:weather_app/view/widgets/utilities.dart';

import '../../model/weather_model.dart';
import '../widgets/custom_text_field.dart';

class SearchByCity extends StatefulWidget {
  const SearchByCity({Key? key}) : super(key: key);

  @override
  State<SearchByCity> createState() => _SearchByCityState();
}

class _SearchByCityState extends State<SearchByCity> {
  static final _formKey = GlobalKey<FormState>();

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
                ),Row(
                  children: [
                    IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Color(0xff6c63ff) ,),
                    Text('Get weather by city name',style: TextStyle(color:  Color(0xff6c63ff),fontWeight: FontWeight.bold,fontSize: width*.07),),
                  ],
                ),
                Image.asset("assets/images/weather.png"),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      CustomTextField(
                        controllerValue: citycontroller,
                        label: 'city',
                        icon: Icons.person,
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                  Weather? weather=await   WeatherController.getWeather(citycontroller.text);
               weather==null?showsnack(context, 'City not found !!'):   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WeatherDetails(weather: weather,)));
                  citycontroller.clear();
                    }
                  },
                  child:const Text('Search',style: TextStyle(color:Color(0xff6c63ff) ),),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
