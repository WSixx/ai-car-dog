import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, '/second'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFbb9e11),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icon.png',
                height: 300,
                width: 300,
              ),
              SizedBox(
                height: 50.0,
              ),
              CircularProgressIndicator(),
              SizedBox(
                height: 30.0,
              ),
              Text('Loading'),
            ],
          ),
        ),
      ),
    );
  }
}
