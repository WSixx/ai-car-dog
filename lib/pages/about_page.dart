import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About'.toUpperCase()),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Text(
            "Simple learning project that uses Machine Learning, using AI to tell if it's a cat or a dog. Not all results are 100% correct, errors can occur",
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
