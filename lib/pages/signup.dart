import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hackify/main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email = "", password = "";
  Future<void> handleSubmit() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //storing userData on cache
      final getStorageInstance = GetStorage();
      Map data = {
        "uid": credential.user?.uid,
        "email": credential.user?.email,
        "phoneNumber": credential.user?.phoneNumber,
        "name": credential.user?.displayName
      };
      getStorageInstance.write("user", data);
      print(getStorageInstance.read("user"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
              onChanged: (value) => {email = value},
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              onChanged: (value) => {password = value},
              decoration: InputDecoration(hintText: "Password"),
            ),
            ElevatedButton(
                onPressed: () {
                  handleSubmit();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyStatefulWidget()),
                  );
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
