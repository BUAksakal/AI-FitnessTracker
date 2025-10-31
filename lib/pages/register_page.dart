import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wtracker/components/my_other_button.dart';
import 'package:wtracker/pages/home_page.dart';
import 'package:wtracker/pages/mainnavigation.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';

class RegisterPage extends StatefulWidget {

  RegisterPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // sign in user (only moved here)
  void registerUserIn() {
    // will be filled later
  }

  void goToMainPage(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainNavigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height:50),
              //logo
              Icon(
                FontAwesomeIcons.dumbbell,
                size:100 ,
              ),
              const SizedBox(height:50),
              //welcome back, you've been missed!
              Text(
                'Let\'s create an account for u',
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16
                ),
              ),
              const SizedBox(height:25),
              //username textfield
              MyTextfield(
                controller: widget.emailController,
                hintText: "Email",
                obscureText: false,
              ),

              const SizedBox(height:10),

              //password textfield
              MyTextfield(
                controller: widget.passwordController,
                hintText: "Password",
                obscureText: true,
              ),

              const SizedBox(height:10),

              MyTextfield(
                controller: widget.cpasswordController,
                hintText: "Confirm Password",
                obscureText: true,
              ),
              const SizedBox(height:10),

              //forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height:25),

              // sign in button
              MyOtherButton(
                onTap: registerUserIn,   // ✅ only this line was fixed
              ),

              const SizedBox(height:50),

              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Or continue with"),
                    ),
                    Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )
                    ),
                  ],
                ),
              ),
              const SizedBox(height:25),

              //google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'assets/icons/googlelogo.png' ),
                ],
              ),
              const SizedBox(height:25),

              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width:4),
                  GestureDetector(
                    onTap:() => goToMainPage(),
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                          color: Colors.blue,fontWeight:FontWeight.bold),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: goToMainPage,
                child: Text(
                  'Continue without account ',
                  style: TextStyle(
                      color: Colors.grey[700],fontWeight:FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}