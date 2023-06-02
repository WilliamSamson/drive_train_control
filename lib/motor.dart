import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ServoPage extends StatefulWidget {
  const ServoPage({
    Key? key,
    required this.sendMessageA,
    required this.sendMessageB,
    required this.sendMessageC,
    required this.sendMessageD,
    required this.sendMessageE,
    required this.sendMessageF,
    required this.sendMessageG,
    required this.sendMessageH,
    required this.sendMessageI,
    required this.sendMessageJ,
    required this.sendMessageK,
    required this.sendMessageL,
    required this.sendMessageM,
    required this.sendMessageN,
    required this.sendMessageO,
    required this.sendMessageP,
  }) : super(key: key);
  final Function sendMessageA;
  final Function sendMessageB;
  final Function sendMessageC;
  final Function sendMessageD;
  final Function sendMessageE;
  final Function sendMessageF;
  final Function sendMessageG;
  final Function sendMessageH;
  final Function sendMessageI;
  final Function sendMessageJ;
  final Function sendMessageK;
  final Function sendMessageL;
  final Function sendMessageM;
  final Function sendMessageN;
  final Function sendMessageO;
  final Function sendMessageP;

  @override
  _ServoPageState createState() => _ServoPageState();
}

class _ServoPageState extends State<ServoPage> {
  int speed = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: Color.fromARGB(255, 177, 173, 220),
              color: Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Gripper',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.sendMessageA();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.circleDot,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        onPressed: () {
                          widget.sendMessageB();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.circleXmark,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 50),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: Colors.black,
              color: Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Wrist',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      //Wrist control
                      IconButton(
                        onPressed: () {
                          widget.sendMessageC();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.levelUp,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        onPressed: () {
                          widget.sendMessageD();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.levelDown,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        /////////////////////////////////
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: Colors.black,
              color: Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Joint',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.sendMessageE();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.angleDoubleLeft,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        onPressed: () {
                          widget.sendMessageF();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.angleDoubleRight,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 50),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: Colors.black,
              color: Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Elbow',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      //Wrist control
                      IconButton(
                        onPressed: () {
                          widget.sendMessageG();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.redo,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        onPressed: () {
                          widget.sendMessageH();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.undo,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        //////////////
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: Colors.black,
              color: Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Shoulder',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.sendMessageI();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.caretUp,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        onPressed: () {
                          widget.sendMessageJ();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.caretDown,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 50),
            Card(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 50,
              shadowColor: Colors.black,
              color: Color.fromARGB(124, 7, 7, 7),
              child: Column(
                children: [
                  Text(
                    'Base',
                    style: GoogleFonts.acme(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      //Wrist control
                      IconButton(
                        onPressed: () {
                          widget.sendMessageK();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                        onPressed: () {
                          widget.sendMessageL();
                        },
                        icon: const Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: speed.toDouble(),
              onChanged: (value) {
                if (speed == 10) {
                  setState(
                    () {
                      widget.sendMessageM();
                    },
                  );
                } else if (speed == 20) {
                  setState(
                    () {
                      widget.sendMessageN();
                    },
                  );
                } else if (speed == 30) {
                  setState(
                    () {
                      widget.sendMessageO();
                    },
                  );
                } else if (speed == 40) {
                  setState(
                    () {
                      widget.sendMessageP();
                    },
                  );
                }
                setState(
                  () {
                    speed = value.toInt();
                  },
                );
              },
              min: 0,
              max: 40,
              divisions: 4,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Speed: $speed",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
