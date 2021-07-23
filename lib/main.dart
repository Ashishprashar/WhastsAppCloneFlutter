import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/home.dart';
// import 'package:camera/camera.dart';
import 'dart:async';

// late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Colors.green,
        primaryColor: Colors.green.shade800,
      ),
      home: Home(),
    );
  }
}
