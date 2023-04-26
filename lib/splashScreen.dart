import 'dart:async';
import 'package:cyber_sathi/homePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();

    Timer(const Duration(milliseconds: 3500), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Container(
        child: Column(
          children: [

            // Lottie Animation
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                width: double.infinity,
                height: 400,
                child: Lottie.asset('assets/animation/cyberSplash.json'),
              ),
            ),

            // App name
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(child: Text("Cyber Sathi",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),
            ),
          ],
        ),
      ),
    );
  }
}