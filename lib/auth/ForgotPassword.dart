import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Layouts/HomePage.dart';

class ForgotPassword extends StatefulWidget{
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String text_msg = "";
  String btn_msg = "send otp";
  bool OTP_sent = false;

  final _formKey = GlobalKey<FormState>();
  final userIdController = TextEditingController();
  final OTP_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 120,),

                // App Logo
                const Icon(Icons.login_outlined,size: 50),

                const SizedBox(height: 25,),

                // Welcome
                Text("Login via OTP",style: TextStyle(color: Colors.grey[700],fontSize: 16,fontWeight: FontWeight.bold),),

                const SizedBox(height: 25,),

                // Id text-field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: userIdController,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter a Email';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "email".toUpperCase(),
                      hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                      prefixIcon: Icon(Icons.mail_lock_outlined),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                // Mobile number text-field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: OTP_Controller,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter a OTP';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "otp".toUpperCase(),
                      hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                      prefixIcon: const Icon(Icons.password_outlined),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(height: 15,),

                // Forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(text_msg.toUpperCase(),),
                    ],
                  ),
                ),

                const SizedBox(height: 20,),

                // Send OTP
                GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_formKey.currentState!.validate()){

                      }
                      if(!OTP_sent && _formKey.currentState!.validate()){
                        text_msg = "otp sent";
                        btn_msg = "verify opt";
                        OTP_sent = true;
                      }else{
                        if(varify()){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                        }
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text(btn_msg.toUpperCase(),style: const TextStyle(color: Colors.white),)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool varify(){

    return false;
  }
}