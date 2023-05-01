import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Layouts/HomePage.dart';
import '../Utils/Toast.dart';
import 'GoogleSignUp_btn.dart';

class SignUpPage extends StatefulWidget{
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool obscurePassword = true;

  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final userNumberController = TextEditingController();
  final userIdController = TextEditingController();
  final passwordController = TextEditingController();

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
              const SizedBox(height: 50,),

              // Unlock Logo
              const Icon(Icons.login_outlined,size: 50),

              const SizedBox(height: 25,),

              // Welcome
              Text("Welcome",style: TextStyle(color: Colors.grey[700],fontSize: 16,fontWeight: FontWeight.bold),),

              const SizedBox(height: 25,),

              // Username text-field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: userNameController,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter a Name';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "name".toUpperCase(),
                      hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                      prefixIcon: const Icon(Icons.perm_identity_outlined),
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

                const SizedBox(height: 15,),

                // Mobile number text-field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: userNumberController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter a Mobile No.';
                      }else{
                        return null;
                      }
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "mobile".toUpperCase(),
                      hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                      prefixIcon: const Icon(Icons.phone),
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

                // Password text-field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: obscurePassword,
                    textInputAction: TextInputAction.next,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter a Password';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "password".toUpperCase(),
                      hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                      prefixIcon: const Icon(Icons.password_outlined),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        child: const Icon(Icons.visibility),
                      ),
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

              const SizedBox(height: 20,),

              // Sign-Up
              GestureDetector(
                onTap: (){
                  if(_formKey.currentState!.validate()){}
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: userIdController.text,
                      password: passwordController.text).then((value) =>
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)),
                  ).onError((error, stackTrace){
                    Toast().toastMessage(error.toString());
                    }
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text("sign up".toUpperCase(),style: const TextStyle(color: Colors.white),)),
                ),
              ),

                const SizedBox(height: 20,),

                const Center(child: Text("or Continue with")),

                const SizedBox(height: 20,),

                GoogleSignUp_btn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}