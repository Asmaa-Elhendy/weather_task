import 'package:flutter/material.dart';
import 'package:weather_app/controller/helper.dart';

import '../screens/user_profile.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
 var color= Color(0xff6c63ff);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width*.6,
      height: height,
      color: Colors.white,
      child: Column(children: [
        SizedBox(height: height*.07,),
        Text("Menu",style: TextStyle(fontSize: width*.05,color: Colors.black)),
        Divider(thickness: 2,),
        SizedBox(height: height*.07,),
        Row(
          children: [
            SizedBox(width: width*.03,),
            Icon(Icons.person),
            SizedBox(width: width*.05,),
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                final  user= AuthenticationHelper().user;
                print(user.displayName);
                print(user.email);
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserProfile(user.email,user.displayName)));
                },
                child: Text('Profile',style: TextStyle(fontSize: width*.05,color: Colors.black54),)),
          ],
        ),
     //   Divider(thickness: 2,)
      ],),
    );
  }
}
