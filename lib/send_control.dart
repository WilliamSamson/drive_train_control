import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'motor.dart';

class ChatPage extends StatefulWidget {
  final BluetoothDevice? server;
  const ChatPage({
    Key? key,
    this.server,
    this.lcdMessage,
  }) : super(key: key);
  final String? lcdMessage;

  @override
  _ChatPageState createState() => _ChatPageState();
}

var hadi;

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  BluetoothConnection? connection;

  bool isConnecting = true;

  bool get isConnected => connection != null && connection!.isConnected;

  bool isDisconnecting = false;
  @override
  void initState() {
    super.initState();

    BluetoothConnection.toAddress(widget.server!.address).then((connection) {
      connection = connection;

      setState(() {
        isConnecting = false;
        isDisconnecting = false;
      });
    });
  }

  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
      mineController.close();
    }
    super.dispose();
  }

  bool btnColor = false;

  StreamController<String> mineController =
      StreamController<String>.broadcast();
  Stream<String> myStream() async* {
    connection?.input?.listen((Uint8List data) {
      print(ascii.decode(data));

      mineController.add(ascii.decode(data));
    });
  }

  int speed = 10;

  Widget build(BuildContext context) {
    String denemee = "No Data";

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 22, 40, 113),
            elevation: 20,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            centerTitle: true,
            title: const Text(
              'Robo Arm Control',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/arm-3.png'),
              ),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                  ),
                ),
                const SizedBox(
                  height: 25,
                  width: 100,
                ),
                const Divider(
                  color: Colors.white,
                  indent: 30,
                  endIndent: 30,
                  thickness: 3,
                  height: 30,
                ),
                const SizedBox(
                  height: 5,
                  width: 25,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ServoPage(
                    sendMessageA: () => _sendMessage('A'), //open
                    sendMessageB: () => _sendMessage('B'), //close
                    sendMessageC: () => _sendMessage('C'), //up
                    sendMessageD: () => _sendMessage('D'), //down
                    sendMessageE: () => _sendMessage('E'),
                    sendMessageF: () => _sendMessage('F'),
                    sendMessageG: () => _sendMessage('G'),
                    sendMessageH: () => _sendMessage('H'),
                    sendMessageI: () => _sendMessage('I'),
                    sendMessageJ: () => _sendMessage('J'),
                    sendMessageK: () => _sendMessage('K'),
                    sendMessageL: () => _sendMessage('L'),
                    sendMessageM: () => _sendMessage('M'),
                    sendMessageN: () => _sendMessage('N'),
                    sendMessageO: () => _sendMessage('O'),
                    sendMessageP: () => _sendMessage('P'),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  indent: 30,
                  endIndent: 30,
                  thickness: 3,
                  height: 30,
                ),
                StreamBuilder<String>(
                  stream: mineController.stream.asBroadcastStream(),
                  builder: (context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80, vertical: 20),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }
                    return Center(
                      child: Text(
                        snapshot.data ?? denemee,
                        style: const TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 14, 9, 86)),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  btnColorChange() {
    setState(() {
      btnColor = !btnColor;
    });
  }

  _sendMessage(String text) async {
    text = text.trim();

    if (text.isNotEmpty) {
      try {
        connection!.output.add(Uint8List.fromList(utf8.encode(text)));
        await connection!.output.allSent;
      } catch (e) {
        // Ignore error, but notify state

      }
    }
  }

  _receiveMessage() {
    connection!.input!.listen(
      (Uint8List data) {
        print('Data incoming: ${ascii.decode(data)}');
        void deneme = ascii.decode(data);

        return deneme;
      },
    );
  }
}
