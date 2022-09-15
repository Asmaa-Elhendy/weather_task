import 'package:flutter/material.dart';
import 'package:weather_app/controller/helper.dart';
import 'package:weather_app/view/widgets/custom_text_field.dart';

Future<void> showMyDialog(context,String label,IconData iconData,TextEditingController controller) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit user data'),
        content: SingleChildScrollView(
          child:Column(children: [
            CustomTextField(label: label, icon: iconData, controllerValue: controller)
          ],)
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('save'),
            onPressed:()async{if(label=='password'){
              Navigator.pop(context);
            }else if (label=='Name'){
              final user= AuthenticationHelper().user;
              await user?.updateDisplayName(controller.text);
              Navigator.pop(context);

            }else if (label=='Email'){

              final user= AuthenticationHelper().user;
              await user?.updateEmail(controller.text);
              Navigator.pop(context);

            }else if (label=='password'){

              final user= AuthenticationHelper().user;
              await user?.updatePassword(controller.text);
              Navigator.pop(context);

            }

            else{
              Navigator.pop(context);
            }
  }
          ),
        ],
      );
    },
  );
}