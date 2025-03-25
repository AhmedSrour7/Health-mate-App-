import 'package:flutter/material.dart';

class HeadInjuryDetails extends StatelessWidget {
  const HeadInjuryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFDCEEEB),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          ' First Aid ',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Color(0XFF7FD0C3),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  'Case2 (Head Injury)',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0XFFC0E7CD),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Action:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '• Check the person\'s responsiveness. Gently talk to them and see if they respond.\n'
                    '• If they are unconscious, call emergency services immediately.\n'
                    '• If they are conscious, assess for breathing and circulation. If they are not breathing, begin CPR.\n'
                    '• Control any bleeding with a clean cloth and gentle pressure. Do not apply pressure if you suspect a skull fracture.\n'
                    '• Keep the person still and comfortable, ideally lying down with head and shoulders slightly elevated.\n',
                  ),
                  Text(
                    'Do Not:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Move the person unless absolutely necessary, especially if you suspect a spinal injury.\n'
                    '• Give them anything to eat or drink.\n'
                    '• Remove a helmet unless a medical professional instructs you to do so.\n'
                    '• Try to wake an unconscious person.\n',
                  ),
                  Text(
                    'Monitor:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Keep an eye on their breathing and level of consciousness.\n'
                    '• Watch for signs of vomiting, confusion, or seizures.\n'
                    '• Call emergency services if their condition worsens.\n',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
