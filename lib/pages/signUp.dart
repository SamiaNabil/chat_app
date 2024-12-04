import 'package:chat_app/constants/constant.dart';
import 'package:chat_app/widgets/textfield.dart';
import 'package:chat_app/helper/snack.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class signUp extends StatefulWidget {
  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? Email;
  String? Password;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Kprimarycolor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Image.asset(kimage),
                ),
                Center(
                  child: Text(
                    "SNT COMMUNITY",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                SizedBox(height: 10),
                TextFieldd(
                  onchanged: (data) {
                    Email = data;
                  },
                  label: "Email",
                  hint: "enter email:",
                ),
                SizedBox(height: 10),
                TextFieldd(
                  onchanged: (data) {
                    Password = data;
                  },
                  label: "Password",
                  hint: "enter password:",
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        var auth = FirebaseAuth.instance;
                        UserCredential user =
                            await auth.createUserWithEmailAndPassword(
                          email: Email!,
                          password: Password!,
                        );
                        snack(context, "Success");
                        Navigator.pushNamed(context, ChatPage.id);
                      } catch (e) {
                        snack(context, e.toString());
                      }
                      isloading = false;
                      setState(() {});
                    }
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 60,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style:
                              TextStyle(color: Color(0xff2b475e), fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Login.id);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
