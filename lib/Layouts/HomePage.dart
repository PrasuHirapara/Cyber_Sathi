import 'package:flutter/material.dart';

import '../Permission_manager/permission_code.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _checkPermissions() async {
    await requestStoragePermission();
  }

  @override
  Widget build(BuildContext context) {
    _checkPermissions();
    return Scaffold(
      backgroundColor: Colors.white,

    );
  }
}