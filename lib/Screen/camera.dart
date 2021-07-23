import 'dart:async';

import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
// import 'package:flutter/services.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  var _cameraController;
  var cameras;
  late Future<void> cameraValue;
  bool isRecoring = false;
  bool flash = false;
  bool iscamerafront = true;
  double transform = 0;
  bool isReady = false;
  @override
  void initState() {
    super.initState();
    // SystemChrome.setEnabledSystemUIOverlays([]);

    // _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    // cameraValue = _cameraController.initialize();
    setupCameras();
  }

  @override
  void dispose() {
    if (_cameraController != null) {
      _cameraController.dispose();
    }
    super.dispose();
  }

  Future setupCameras() async {
    try {
      cameras = await availableCameras();
      _cameraController =
          new CameraController(cameras[0], ResolutionPreset.high);
      // await _cameraController.initialize();
    } on CameraException catch (e) {
      setState(() {
        isReady = false;
      });
    }
    setState(() {
      isReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (!_cameraController.value.isInitialized) {
    //   return Container();
    // }
    var wi = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            //   FutureBuilder(
            // future:
            //     _cameraController != null ? _cameraController.initialize() : null,
            // builder: (ctx, snapShot) {
            //   if (snapShot.connectionState == ConnectionState.done) {
            //     return Container(
            //         // aspectRatio: _cameraController.value.aspectRatio,
            //         height: MediaQuery.of(context).size.height,
            //         width: MediaQuery.of(context).size.width,
            //         child:
            // CameraPreview(_cameraController)
            Container(
              height: MediaQuery.of(context).size.height,
              child: Image.network(
                "https://files.oyebesmartest.com/uploads/large/115513299325ek55nr8un8qqhatyti1fip2amjxr8f3nnkz2h5siwurotrssysemnbpxek5q8m7uophqj97wmvzgzprpa9nefghhivukjyryhdi.jpg",
                fit: BoxFit.cover,
                // )
              ),
            ),
            //         ;
            //   } else {
            //     return Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   }
            // },
            // ),
            Positioned(
                bottom: 0,
                right: wi / 2 - 35,
                child: Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                  size: 80,
                )),
            Positioned(
                bottom: 20,
                left: (wi / 2 - 35) / 2 - 10,
                child: Icon(
                  Icons.flash_off,
                  color: Colors.white,
                  size: 40,
                )),
            Positioned(
                bottom: 20,
                right: (wi / 2 - 35) / 2 - 10,
                child: Icon(
                  Icons.switch_camera_rounded,
                  color: Colors.white,
                  size: 40,
                )),
            //     // Positioned(
            //     //     bottom: 100,
            //     //     child: Container(
            //     //       height: 150,
            //     //       width: double.infinity,
            //     //       child: Card(
            //     //         color: Colors.white,
            //     //         elevation: 8,
            //     //       ),
            //     //     )
            //     //     // Container(
            //     //     //   height: 100,
            //     //     //   width: 100,
            //     //     //   color: Colors.red,
            //     //     // )
            //     //     ),
          ],
        ),
      ),
    );
  }
}
