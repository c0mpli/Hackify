// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hackify/main.dart';
import 'package:hackify/pages/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email = "", password = "", name = "";
  Future<void> handleSubmit() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user?.updateDisplayName(name);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Registered Successfully. Please Login..",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Password Provided is too Weak",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Account Already exists",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
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
            Text("SIGNUP"),
            TextFormField(
              onChanged: (value) => {name = value},
              decoration: InputDecoration(
                hintText: "Name",
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
            ),
            TextFormField(
              onChanged: (value) => {email = value},
              decoration: InputDecoration(
                hintText: "Email",
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Email';
                } else if (!value.contains('@')) {
                  return 'Please Enter Valid Email';
                }
                return null;
              },
            ),
            TextFormField(
              onChanged: (value) => {password = value},
              decoration: InputDecoration(
                hintText: "Password",
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Password';
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  handleSubmit();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text("Submit")),
            Row(
              children: [
                Text('Already have an account?'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
