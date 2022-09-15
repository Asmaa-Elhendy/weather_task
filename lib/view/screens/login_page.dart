import 'package:flutter/material.dart';
import 'package:weather_app/view/screens/register_page.dart';
import '../../controller/helper.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/utilities.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final _formKey = GlobalKey<FormState>();

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  AuthenticationHelper helper =  AuthenticationHelper();
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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: height * .1,
                  ),Text('LOGIN',style: TextStyle(color:  Color(0xff6c63ff),fontWeight: FontWeight.bold,fontSize: width*.07),),
                  Image.asset("assets/images/weather.png"),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        CustomTextField(
                          controllerValue: emailcontroller,
                          label: 'Email',
                          icon: Icons.person,
                        ),
                        CustomTextField(
                          controllerValue: passwordcontroller,
                          label: 'password',
                          icon: Icons.person,
                        )
                      ],
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                          helper.signIn(email: emailcontroller.text, password: passwordcontroller.text).
                          then((value){
                            if (value == null) {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                            } else {
                              showsnack(context,'$value');
                            }
                          });
                      }
                    },
                    child:const Text('SIGNIN',style: TextStyle(color:Color(0xff6c63ff) ),),
                  ),
               SizedBox(height: height*.03,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
                    },
                    child: const Text('Tap to register if you don\'t have account !',style: TextStyle(color:Color(0xff6c63ff),decoration: TextDecoration.underline,
                    ),),
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
