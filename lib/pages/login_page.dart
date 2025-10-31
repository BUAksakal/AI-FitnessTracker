import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wtracker/components/my_button.dart';
import 'package:wtracker/components/my_textfield.dart';
import 'package:wtracker/components/square_tile.dart';
import 'package:wtracker/pages/register_page.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in user
   void signUserIn(){
   }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void goToRegisterPage(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  RegisterPage()),
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
                FontAwesomeIcons.brain,
                  size:100 ,
              ),
              const SizedBox(height:50),
              //welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16
                ),
              ),
              const SizedBox(height:25),
              //username textfield
              MyTextfield(
                controller: widget.usernameController,
                hintText: "Username",
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
              //forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height:25),
              // sign in button
              MyButton(
                onTap:widget.signUserIn ,
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
                    'Not a member',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width:4),
                  GestureDetector(
                    onTap:() => goToRegisterPage(),
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,fontWeight:FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
