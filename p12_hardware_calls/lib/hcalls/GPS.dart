import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GPSDetector extends StatefulWidget {
  const GPSDetector({super.key});

  @override
  State<GPSDetector> createState() => _GPSDetectorState();
}

class _GPSDetectorState extends State<GPSDetector> {
  // Geolocator geoloc= Geolocator();
  double latitude = 0;
  double longitude = 0;
  getGPSData() async {
    PermissionStatus gpsPermission = await Permission.location.request();
    Position currentPosition = await Geolocator.getCurrentPosition();

    setState(() {
      latitude = currentPosition.latitude;
      longitude = currentPosition.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text("Latitude: $latitude "),
          Text("Longitude: $longitude "),
          OutlinedButton(
              onPressed: () {
                getGPSData();
              },
              child: Text('Get GPS data. '))
        ]),
      ),
    );
  }
}
