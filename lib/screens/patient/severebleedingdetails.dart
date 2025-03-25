import 'package:flutter/material.dart';

class SeverebleedingDetails extends StatelessWidget {
  const SeverebleedingDetails({super.key});

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
                  'Case5 (Severe Bleeding)',
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
                    'Actions:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '• Act Quickly: Severe bleeding is serious.\n'
                    '• Safety First: Only approach if safe.\n'
                    '• Call Emergency Services Immediately: Don\'t wait for bleeding to stop.\n',
                  ),
                  Text(
                    'Control the Bleeding:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Direct Pressure: Apply firm, continuous pressure with clean cloth/hand on wound.\n'
                    '• Elevation: Raise injured area above heart level (if possible) to slow blood flow.\n',
                  ),
                  Text(
                    'Dressing and Bandaging (Once Bleeding Slows):',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Padding: Place sterile dressing or clean cloth over the wound.\n'
                    '• Bandage Securely: Wrap firmly to maintain pressure, but not cut off circulation.\n',
                  ),
                  Text(
                    'Monitor and Stay Calm:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Continue Pressure: Keep applying pressure until help arrives.\n'
                    '• Maintain Warmth: Cover person with blanket to prevent heat loss.\n'
                    '• Reassurance: Stay calm and reassure the person.\n',
                  ),
                  Text(
                    'Tourniquet (Last Resort):',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Only if direct pressure/elevation fail and severe limb bleeding occurs.\n'
                    '• Apply high on limb, closest to torso. Note down application time.\n',
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
                    '• Probe the wound.\n'
                    '• Apply ice directly to the wound.\n'
                    '• Use a tourniquet unless absolutely necessary.\n'
                    '• Remember: Call emergency services immediately for severe bleeding.\n',
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
