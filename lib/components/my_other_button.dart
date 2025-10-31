import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOtherButton extends StatefulWidget {
  final Function()? onTap;
  const MyOtherButton({super.key,required this.onTap});

  @override
  State<MyOtherButton> createState() => _MyOtherButtonState();
}

class _MyOtherButtonState extends State<MyOtherButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onTap ,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8)
        ),
        child:const Center(
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
        ) ,
      ),
    );
  }
}
