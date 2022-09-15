import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatefulWidget {
  String label;
  var icon;

  TextEditingController controllerValue;

  CustomTextField(
      {Key? key,
        required this.label,
        required this.icon,
        required this.controllerValue,
      })
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height*.02),
      child: Container(
        width: width*.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

        ),
        child: TextFormField(
          controller: widget.controllerValue,
         autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Color(0xff6c63ff),
              )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                   color: Colors.grey,
                  )),errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.red,
              )),focusedErrorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.grey,
              )),
              prefixIcon:Icon(widget.icon,color: const Color(0xff6c63ff),),
              labelText: '${widget.label}',
              labelStyle: const TextStyle(
                color: Colors.black45,

              ),
           contentPadding: EdgeInsets.symmetric(vertical: height*.01)
          ),
          validator: (value){
            if(widget.label=='Email'){
              if (EmailValidator.validate(value!)) {
                return null;
              }
              if (value.length == 0) {
                return "* please enter email";
              }
              return "* please enter valid email";
            }
          else  if (value == null || value.isEmpty) {
              return '* Please enter ${widget.label}';
            }
          },
        ),
      ),
    );
  }
}