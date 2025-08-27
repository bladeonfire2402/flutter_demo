import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DemoFont extends StatelessWidget {
const DemoFont({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo fonts"),
      ),
      body: Center(
        child: Column(
          children:[
            const Text("Lexend Bold", style: TextStyle(
              fontFamily: "Lexend",
              fontWeight: FontWeight.w600
            ),),
            const Text("Lexend Black", style: TextStyle(
              fontFamily: "Lexend",
              fontWeight: FontWeight.w800
            ),),
            const Text("Lexend normal", style: TextStyle(
              fontFamily: "Lexend",
              fontWeight: FontWeight.w400
            ),),
          ] ,
        ),
      ),
    );
  }
}