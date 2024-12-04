import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login.dart';
import 'package:chat_app/pages/signUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'SignUp':(context) => signUp(),
        Login.id:(context) => Login(),
        ChatPage.id:(context) => ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute:'SignUp',
    );
  }
}
