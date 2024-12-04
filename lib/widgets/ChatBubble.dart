import 'package:chat_app/constants/constant.dart';
import 'package:flutter/material.dart';

class chatbubble extends StatelessWidget {
  const chatbubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
       // alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(28),
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          color: Kprimarycolor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(32),
         topLeft: Radius.circular(32)
          ,bottomRight: Radius.circular(32)),
        ),
        
        child: Text("iam samia nabil",style: TextStyle(color: Colors.white),),
        ),
    );
  }
}
