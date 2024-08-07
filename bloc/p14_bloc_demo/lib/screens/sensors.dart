import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorsDemo extends StatefulWidget {
  const SensorsDemo({super.key});

  @override
  State<SensorsDemo> createState() => _SensorsDemoState();
}

class _SensorsDemoState extends State<SensorsDemo> {
  MagnetometerEvent? magevent;
  AccelerometerEvent? acceloevent;
  GyroscopeEvent? gyroevent;

  getAcceloData() {
    accelerometerEvents.listen(
      (event) {
        
        print('The data from Accelometer is $accdata')
      },
    );
  }

  getMagnetoData() {}
  getGyroData() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            onPressed: () {
              getAcceloData();
            },
            child: const Text('Get accelerometer data'),
          ),
          MaterialButton(
            onPressed: () {
              getMagnetoData();
            },
            child: const Text('Get magnetometer data'),
          ),
          MaterialButton(
            onPressed: () {
              getGyroData();
            },
            child: const Text('Get gyroscope data'),
          ),
        ],
      )),
    );
  }
}
