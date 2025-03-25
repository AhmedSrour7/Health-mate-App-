import 'package:flutter/material.dart';
import 'package:health_mate/screens/patient/patient_home_screen.dart';
import 'package:health_mate/screens/patient/patient_chats_screen.dart';
import 'package:health_mate/screens/patient/patient_services_screen.dart';
import 'patient_profile_screen.dart';
import 'patient_home_ai_screen.dart';

class PatientBottomNavigationBarPage extends StatefulWidget {
  const PatientBottomNavigationBarPage({super.key});

  @override
  State<PatientBottomNavigationBarPage> createState() => _PatientBottomNavigationBarPageState();
}

class _PatientBottomNavigationBarPageState extends State<PatientBottomNavigationBarPage> {
  int myIndex = 0;
  List<Widget> widgetList = [
    PatientHomePage(),
    PatientHomeAiPage(),
    PatientServicesPage(),
    PatientChatsPage(),
    PatientProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: widgetList[myIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Color.fromARGB(255, 163, 193, 186), blurRadius: 10)
          ],
        ),
        child: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                myIndex = index;
              });
            },
            currentIndex: myIndex,
            iconSize: 22,
            showUnselectedLabels: false,
            backgroundColor: Color(0xffFFFFFB),
            unselectedItemColor: Color(0xff199A8E),
            selectedItemColor: Color.fromARGB(255, 25, 117, 109),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.android), label: 'Ai'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_hospital), label: 'Services'),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
      ),
    );
  }
}
// Image.asset('assets/images/robodoc.png')
// Image.asset('assets/images/Doctors Bag.png')