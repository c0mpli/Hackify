import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hackify/main.dart';
import 'package:hackify/pages/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "", password = "";

  Future<void> handleSubmit() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //storing userData on cache
      final getStorageInstance = GetStorage();
      Map data = {
        "uid": credential.user?.uid,
        "email": credential.user?.email,
        "name": credential.user?.displayName,
      };
      getStorageInstance.write("user", data);
      print(getStorageInstance.read("user"));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyStatefulWidget(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("LOGIN"),
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
                child: Text("Submit")),
            Row(
              children: [
                Text('New here?'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    },
                    child: Text('Signup'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
