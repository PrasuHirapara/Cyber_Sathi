import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Layouts/HomePage.dart';

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
      backgroundColor: Colors.cyanAccent,
      body: Container(
        child: Column(
          children: [
            // Lottie Animation
            const SizedBox(height: 30,),
            Container(
              width: double.infinity,
              height: 400,
              child: Lottie.asset('assets/animation/cyberSplash.json'),
            ),
            const Center(child: Text("Cyber Sathi",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)),
            SizedBox(height: 10,),
            const Center(child: Text("Stay safe",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ],
        ),
      ),
    );
  }
}