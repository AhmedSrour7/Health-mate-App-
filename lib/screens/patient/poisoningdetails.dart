import 'package:flutter/material.dart';

class PoisoningDetails extends StatelessWidget {
  const PoisoningDetails({super.key});

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
                  'Case4 (Poisoning)',
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
                    'Most Important:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '• Call Poison Control Center (1-800-222-1222 US) or emergency services if unconscious, not breathing, or seizing.\n',
                  ),
                  Text(
                    'General Steps:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Stay calm, assess the situation, identify poison if possible.\n'
                    '• Do not induce vomiting unless instructed by poison control.\n'
                    '• Remove any remaining poison from mouth.\n'
                    '• Swallowed poison (conscious, able to swallow): Give small sips of water/milk (unless petroleum product, lye, or drain cleaner).\n'
                    '• Inhaled poison: Move person to fresh air immediately.\n'
                    '• Skin/eye contact: Remove clothing, flush with lukewarm water for 15+ minutes.\n',
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
                    '• Give food/drink unless instructed by poison control.\n'
                    '• Induce vomiting unless instructed by poison control.\n'
                    '• Use medications/home remedies without instruction.\n'
                    '• Delay calling poison control (better safe than sorry). \n',
                  ),
                  Text(
                    'Additional Tips:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Keep person calm and comfortable.\n'
                    '• Gather containers/labels of suspected poison.\n'
                    '• Follow specific instructions from poison control.\n'
                    '• Remember: General guidelines, call poison control or emergency services immediately for any suspected poisoning.\n',
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
