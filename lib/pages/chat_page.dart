import 'package:chat_app/constants/constant.dart';
import 'package:chat_app/widgets/ChatBubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static String id = 'ChatPage';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference messages = firestore.collection('messages');
    return FutureBuilder<QuerySnapshot>(
        future: messages.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.docs[0]["content"]);
            return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Kprimarycolor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            kimage,
                            fit: BoxFit.cover,
                            height: 50,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'SNT CHAT',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return chatbubble();
                      }),
                    ),
                    TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          'content': data,
                        });
                        controller.clear();
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Kprimarycolor,
                            )),
                        hintText: "Enter a message",
                        suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            color: Kprimarycolor,
                            onPressed: () {
                              //print("ok");
                            }),
                      ),
                    )
                  ],
                ),
                );
          } else {
            return Text("loading...");
          }
        });
  }
}
