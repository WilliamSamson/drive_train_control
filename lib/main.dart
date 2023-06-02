import 'package:drive_train_control/send_control.dart';
import 'package:drive_train_control/connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bluetooth Control',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          secondary: Color.fromARGB(255, 10, 4, 49),
          primary: Color.fromARGB(255, 11, 7, 94),
        ),
      ),
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return FutureBuilder(
            future: FlutterBluetoothSerial.instance.requestEnable(),
            builder: (BuildContext context, future) {
              if (future.connectionState == ConnectionState.waiting) {
                return Scaffold(
                  body: Container(
                    height: double.infinity,
                    child: const Center(
                      child: Icon(
                        Icons.bluetooth_disabled,
                        size: 200,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                );
              } else {
                return const Home();
              }
            },
          );
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(6.5),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 10, 21, 77),
          title: const Text(
            "Connectable devices",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/sicon.jpg'),
            ),
          ),
          child: SelectBondedDevicePage(
            onCahtPage: (device1) {
              BluetoothDevice device = device1;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ChatPage(
                      server: device,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
