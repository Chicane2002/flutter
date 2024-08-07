import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPS Detector',
      home: GPSDetector(),
    );
  }
}

class GPSDetector extends StatefulWidget {
  const GPSDetector({Key? key}) : super(key: key);

  @override
  _GPSDetectorState createState() => _GPSDetectorState();
}

class _GPSDetectorState extends State<GPSDetector> {
  double latitude = 0;
  double longitude = 0;

  Future<void> getGPSData() async {
    PermissionStatus locationPermission = await Permission.location.request();
    if (locationPermission.isGranted) {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        latitude = currentPosition.latitude;
        longitude = currentPosition.longitude;
      });
    } else {
      // Handle the scenario if permission is denied
      print('Location permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GPS Detector'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 400,
            width: 200,
            child: Card(
              elevation: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Latitude: $latitude"),
                  Text("Longitude: $longitude"),
                  OutlinedButton(
                    onPressed: getGPSData,
                    child: Text('Get GPS data'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
