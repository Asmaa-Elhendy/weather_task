

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/controller/save_location_local.dart';
import 'package:weather_app/view/widgets/utilities.dart';

import '../../controller/helper.dart';
import '../../controller/weather_controller.dart';
import '../widgets/edit-alert.dart';

class UserProfile extends StatefulWidget {
  String mail='';
  String name='';
UserProfile(this.mail,this.name);
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
String name='';
String email='';
  AuthenticationHelper helper =  AuthenticationHelper();
  var color = const Color(0xff6c63ff);
  TextEditingController namecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
getuser()async{
final user=  await  helper.user;
setState(() {
  name=user.displayName;
  email=user.email;
});
}
String lat='';
String long='';
 final localstoarage=LocalStore();
final getstorage=GetStorage();
  @override

  void initState() {
  print(' in mail ${widget.mail}');
  print(widget.name);
    // TODO: implement initState
    super.initState();
    getuser();
  namecontroller..text=widget.name;
  emailcontroller..text=widget.mail;


  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(appBar: AppBar(backgroundColor: color,),

      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset("assets/images/profile.png"),

          InkWell(
            onTap: (){
              showMyDialog(context,'Name',Icons.person,namecontroller);

            },
            child: Row(
              children: [
                SizedBox(width: width*.06,),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: color,)),
                SizedBox(height:width*.06 ,),Text('Edit name',style: TextStyle(color: color),)
              ],
            ),
          ),
          InkWell(
            onTap: (){
              showMyDialog(context,'Email',Icons.person,emailcontroller);
            },
            child: Row(
              children: [
                SizedBox(width: width*.06,),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: color,)),
                SizedBox(height:width*.06 ,),Text('Edit Email',style: TextStyle(color: color),)
              ],
            ),
          ),
          InkWell(
       onTap: ()async{

         var location =
             await WeatherController().requestPermissionLocation();
         setState(() {
           bool islocation=false;
           if (location == null) {
             islocation = false;
           } else {
             islocation = true;
             LocalStore().saveLocation(lat, long);
             lat = location[0].toString();
             long = location[1].toString();
             showsnack(context, 'location saved lat ${lat} , long:$long');


           }
         });
       },
            child: Row(
              children: [
                SizedBox(width: width*.06,),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: color,)),
                SizedBox(height:width*.06 ,),Text('Tap to Edit location',style: TextStyle(color: color),)
              ],
            ),
          ),
          InkWell(
            onTap: (){
              showMyDialog(context,'password',Icons.person,passwordcontroller);
            },
            child: Row(
              children: [
                SizedBox(width: width*.06,),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: color,)),
                SizedBox(height:width*.06 ,),Text('Edit password',style: TextStyle(color: color),)
              ],
            ),
          ),
        ],),
      ),
    );
  }
}
