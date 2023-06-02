import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothDeviceListEntry extends StatelessWidget {
  const BluetoothDeviceListEntry(
      {Key? key, required this.onTap, required this.device})
      : super(key: key);
  final VoidCallback onTap;
  final BluetoothDevice? device;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const Icon(
        Icons.devices,
        color: Colors.white,
      ),
      title: Text(
        device!.name ?? "Unknown Device",
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        device!.address.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: InkWell(
        onTap: onTap,
        child: Card(
          color: const Color.fromARGB(255, 13, 3, 71),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 5,
            child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Connect',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
