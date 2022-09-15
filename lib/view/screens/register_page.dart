import 'package:flutter/material.dart';
import 'package:weather_app/controller/helper.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/utilities.dart';
import 'home.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static final _formKey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
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
                  ),Text('Register',style: TextStyle(color:  Color(0xff6c63ff),fontWeight: FontWeight.bold,fontSize: width*.07),),
                  Image.asset("assets/images/weather.png"),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controllerValue: namecontroller,
                          label: 'Name',
                          icon: Icons.person,
                        ),
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
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                     helper.signUp(email: emailcontroller.text, password: passwordcontroller.text).
                     then((value) async {
                       if (value == null) {
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                         final user= helper.user;
                         await user?.updateDisplayName(namecontroller.text);

                       } else {
                    showsnack(context,'$value');

                       }
                     });



                      }
                    },
                    child: Text('SIGNUP',style: TextStyle(color:Color(0xff6c63ff) ),),
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
