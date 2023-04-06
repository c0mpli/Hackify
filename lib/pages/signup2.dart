import 'package:flutter/material.dart';
import 'package:hackify/components/my_textfield.dart';
import 'package:hackify/components/new_button.dart';
import 'package:hackify/components/square_tile.dart';


class SignupPageTwo extends StatelessWidget {
  SignupPageTwo({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              // logo
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("photos/hackify3.jpg"),
                    fit: BoxFit.cover,
                  )
                ),
              ),

              const SizedBox(height: 10),

              // welcome back, you've been missed!
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0xFF114a73),
                  fontSize: 16,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              Container(
                width: 350,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(
                      color: Color(0xFFABABAB),
                      fontFamily: 'Ubuntu',
                      letterSpacing: 1,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Color(0xFFEBF6FF),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Color(0xFFB4DEFF),
                      ),
                    ),
                  ),
                  controller: usernameController,

                  obscureText: false,
                ),
              ),

              const SizedBox(height: 10),

              // password textfield

              Container(
                width: 350,
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Color(0xFFABABAB),
                      fontFamily: 'Ubuntu',
                      letterSpacing: 1,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Color(0xFFEBF6FF),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Color(0xFFB4DEFF),
                      ),
                    ),
                  ),
                  controller: emailController,

                ),
              ),

              const SizedBox(height: 10),

              Container(
                width: 350,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Color(0xFFABABAB),
                      fontFamily: 'Ubuntu',
                      letterSpacing: 1,

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Color(0xFFEBF6FF),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: Color(0xFFB4DEFF),
                      ),
                    ),
                  ),
                  controller: passwordController,

                ),
              ),

              const SizedBox(height: 10),

              // forgot password?

              const SizedBox(height: 25),

              // sign in button
              MyButton2(
                onTap: signUserIn,
              ),

              const SizedBox(height: 30),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),

                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),


              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member? ',
                    style: TextStyle
                      (color: Colors.grey[700],
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}