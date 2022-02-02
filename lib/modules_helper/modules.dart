import 'package:flutter/material.dart';

void navigateAndFinish(context, {required Widget goToScreen}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => goToScreen));
}

void navigateAndBack(context, {required Widget goToScreen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => goToScreen));
}

Widget make_def_buttons_for_rigesteration({
  required TextEditingController? controller,
  required String? lableword,
  IconData? suffix_icon,
  Function()? suffix_fun,
  TextInputType keyboard_type = TextInputType.text,
  bool isPassword = false,
  required String? Function(String? val)? validate_fun,
}) {
  return Container(
      child: TextFormField(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.end,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
        keyboardType: keyboard_type,
        controller: controller,
        obscureText: isPassword,
        onFieldSubmitted: (String value) {
          print(value);
        },
        onChanged: (String value) {
          print(value);
        },
        validator: validate_fun,
        decoration: InputDecoration(
          hintText: lableword,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
      ));
}
