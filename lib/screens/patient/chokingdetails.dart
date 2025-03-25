import 'package:flutter/material.dart';

class ChokingDetails extends StatelessWidget {
  const ChokingDetails({super.key});

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
                  'Case3 (Choking )',
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
                    'Adult:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '• If coughing forcefully, let them cough.\n'
                    '• If unconscious, call emergency services and begin CPR (if trained).\n'
                    '• If conscious and cannot cough etc., perform Heimlich Maneuver:\n'
                    '1.Stand behind, hug waist.\n'
                    '2.Make fist above navel, grasp with other hand.\n'
                    '3.Thrust upwards into abdomen.\n'
                    '4.Repeat until object dislodges or help arrives.\n'
                    '5.For pregnant/overweight: use chest thrusts on breastbone instead.\n',
                  ),
                  Text(
                    'Infant (Over 1 year):',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Lay face down on forearm, support head/jaw.\n'
                    '• Deliver 5 back blows between shoulder blades.\n'
                    '• Flip over, give 5 chest thrusts (2 fingers, center of chest).\n'
                    '• Repeat until object dislodges or help arrives.\n',
                  ),
                  Text(
                    'Infant (Under 1 year):',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Lay face down on forearm, support head/jaw.\n'
                    '• Deliver 5 back blows between shoulder blades.\n'
                    '• Hold face up, cradled. Support head.\n'
                    '• Deliver 5 chest thrusts (2 fingers, center of chest). \n'
                    '• Repeat until object dislodges or help arrives.\n',
                  ),
                  Text(
                    'General:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '• Call emergency services if unresponsive or object not dislodged.\n'
                    '• Stay calm, continue first aid until help arrives.\n'
                    '• Call emergency services if unsure about performing first aid.\n',
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
