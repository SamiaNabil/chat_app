import 'package:flutter/material.dart';

class TextFieldd extends StatelessWidget {
  TextFieldd({this.hint, this.label,this.onchanged});
  String? hint;
  String? label;
  Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if(data!.isEmpty){
          return 'Please form this field';
          }
      },
      onChanged: onchanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
      ),
    );
  }
}
