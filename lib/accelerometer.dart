import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sensors/flutter_sensors.dart';



class Accelerometer_control extends StatefulWidget {
  @override
  _Accelerometer_controlState createState() => _Accelerometer_controlState();
}

class _Accelerometer_controlState extends State<Accelerometer_control> {
  bool _accelAvailable = false;
  List<double> _accelData = List.filled(3, 0.0);
  StreamSubscription? _accelSubscription;

  @override
  void initState() {
    _checkAccelerometerStatus();
    super.initState();
  }

  @override
  void dispose() {
    _stopAccelerometer();
    super.dispose();
  }

  void _checkAccelerometerStatus() async {
    await SensorManager()
        .isSensorAvailable(Sensors.ACCELEROMETER)
        .then((result) {
      setState(() {
        _accelAvailable = result;
      });
    });
  }

  Future<void> _startAccelerometer() async {
    if (_accelSubscription != null) return;
    if (_accelAvailable) {
      final stream = await SensorManager().sensorUpdates(
        sensorId: Sensors.ACCELEROMETER,
        interval: Sensors.SENSOR_DELAY_FASTEST,
      );
      _accelSubscription = stream.listen((sensorEvent) {
        setState(() {
          _accelData = sensorEvent.data;
        });
        sendControlSignals();
      });
    }
  }

  void _stopAccelerometer() {
    if (_accelSubscription == null) return;
    _accelSubscription?.cancel();
    _accelSubscription = null;
  }

  void sendControlSignals() {
    if (_accelData[1] < -1.0) {
      // Tilt forward
      // Send 'F' for forward
      // TODO: Send the control signal to your Arduino car via Bluetooth
    } else if (_accelData[1] > 1.0) {
      // Tilt backward
      // Send 'B' for backward
      // TODO: Send the control signal to your Arduino car via Bluetooth
    } else if (_accelData[0] > 1.0) {
      // Tilt to the right
      // Send 'R' for turn right
      // TODO: Send the control signal to your Arduino car via Bluetooth
    } else if (_accelData[0] < -1.0) {
      // Tilt to the left
      // Send 'L' for turn left
      // TODO: Send the control signal to your Arduino car via Bluetooth
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Accelerometer Control'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          alignment: AlignmentDirectional.topCenter,
          child: Column(
            children: <Widget>[
              Text(
                "Accelerometer Test",
                textAlign: TextAlign.center,
              ),
              Text(
                "Accelerometer Enabled: $_accelAvailable",
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: 16.0)),
              Text(
                "[0](X) = ${_accelData[0]}",
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: 16.0)),
              Text(
                "[1](Y) = ${_accelData[1]}",
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: 16.0)),
              Text(
                "[2](Z) = ${_accelData[2]}",
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: 16.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    child: Text("Start"),
                    color: Colors.green,
                    onPressed:
                        _accelAvailable ? () => _startAccelerometer() : null,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  MaterialButton(
                    child: Text("Stop"),
                    color: Colors.red,
                    onPressed:
                        _accelAvailable ? () => _stopAccelerometer() : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
