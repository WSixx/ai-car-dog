import 'dart:io';
import 'package:cat_or_dog_ia/helpers/camera_helper.dart';
import 'package:cat_or_dog_ia/helpers/tflite_helper.dart';
import 'package:cat_or_dog_ia/models/tflite_results.dart';
import 'package:cat_or_dog_ia/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  List<TFLiteResult> _outputs = [];

  @override
  void initState() {
    super.initState();
    TFLiteHelper.loadModel();
  }

  @override
  void dispose() {
    TFLiteHelper.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(context),
      appBar: AppBar(
        centerTitle: true,
        title: Text('CAT OR DOG?'),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildResult(),
            _buildImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: _pickCameraImage,
                  color: Colors.red[600],
                  child: Icon(Icons.photo_camera),
                ),
                RaisedButton(
                  onPressed: _pickImage,
                  color: Colors.indigo,
                  child: Icon(Icons.filter),
                ),
              ],
              //onPressed: _pickImage,
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }

  _buildImage() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 10.0),
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: _image == null
                ? Text('Open an Image')
                : Image.file(
                    _image,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }

  _pickImage() async {
    final image = await CameraHelper.pickImage();
    if (image == null) {
      return null;
    }

    final outputs = await TFLiteHelper.classifyImage(image);

    setState(() {
      _image = image;
      _outputs = outputs;
    });
  }

  _pickCameraImage() async {
    final image = await CameraHelper.pickCameraImage();
    if (image == null) {
      return null;
    }

    final outputs = await TFLiteHelper.classifyImage(image);

    setState(() {
      _image = image;
      _outputs = outputs;
    });
  }

  _buildResult() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Container(
        height: 150.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: _buildResultList(),
      ),
    );
  }

  _buildResultList() {
    if (_outputs.isEmpty) {
      return Center(
        child: Text(''),
      );
    }

    return Center(
      child: ListView.builder(
        itemCount: _outputs.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Text(
                '${_outputs[index].label.substring(1)}',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Confidence: ${(_outputs[index].confidence * 100.0).toStringAsFixed(2)} %',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              SizedBox(
                height: 10.0,
              ),
              LinearPercentIndicator(
                lineHeight: 18.0,
                percent: _outputs[index].confidence,
                progressColor: Colors.green,
              ),
            ],
          );
        },
      ),
    );
  }
}
