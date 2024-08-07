import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Cam extends StatefulWidget {
  const Cam({super.key});

  @override
  State<Cam> createState() => _CamState();
}

class _CamState extends State<Cam> {
  late List<CameraDescription>
      cameras; //contains list of all cameras; 3 in back, 1 in front foe eg
  late CameraController camcont;
  bool isCameraRunning = false;

  @override
  void initState() {
    super.initState();
    initialiseCameras();
  }

  initialiseCameras() async {
    cameras = await availableCameras();
    print('These are the available cameras: $cameras');
  }

  openCamera() async {
    camcont = CameraController(cameras[0], ResolutionPreset.medium);
    await camcont.initialize();
    setState(() {
      isCameraRunning = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          // Text("Latitude: $latitude "),
          // Text("Longitude: $longitude "),
          OutlinedButton(
              onPressed: () {
                openCamera();
              },
              child: Text('Start camera ')),
          OutlinedButton(
              onPressed: () async {
                XFile captImage = await camcont.takePicture();
              },
              child: Text('Take Picture '))
        ]),
      ),
    );
  }
}
