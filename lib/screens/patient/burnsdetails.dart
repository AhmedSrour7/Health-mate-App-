import 'package:flutter/material.dart';

class BurnsDetails extends StatelessWidget {
  const BurnsDetails({super.key});

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
                  'Case1 (burns)',
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
                    'First-Degree Burns:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Action:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '• Cool the burn with cold running water for about 10 minutes. Gently remove any jewelry or tight clothing near the burn site (unless stuck to the skin).\n',
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
                    '• Cool the burn with cold running water for about 10 minutes. Gently remove any jewelry or tight clothing near the burn site (unless stuck to the skin).\n'
                    '• Use ice or very cold water, as it can cause further damage to the tissue.\n'
                    '• Use adhesive bandages directly on the burn.\n',
                  ),
                  Text(
                    'Monitor and Seek Medical Attention (if needed):',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• While first-degree burns typically heal on their own within a week or two, watch for signs of infection like redness that worsens, pus, or fever.\n',
                  ),
                  Text(
                    'Seek medical attention if:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• The burned area is large (wider than three inches).\n'
                    'The burn is on the face, hands, feet, or genitals\n'
                    'The burn is deep or appears white or charred\n'
                    'Blisters appear large or broken\n',
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
