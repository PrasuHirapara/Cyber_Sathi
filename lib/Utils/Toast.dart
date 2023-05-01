import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Toast{

  void toastMessage(String msg){
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16
    );
  }
}