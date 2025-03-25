import 'package:flutter/material.dart';
import 'package:health_mate/screens/observer/observer_chats_screen.dart';
import 'package:health_mate/screens/observer/observer_profile_screen.dart';

import 'observer_patient_measures_screen.dart';

class ObserverBottomNavigationBarPage extends StatefulWidget {
  const ObserverBottomNavigationBarPage({super.key});

  @override
  State<ObserverBottomNavigationBarPage> createState() => _ObserverBottomNavigationBarPageState();
}

class _ObserverBottomNavigationBarPageState extends State<ObserverBottomNavigationBarPage> {
   int myIndex = 0;
  List <Widget> widgetList = [
    ObserverPatientMeasurePage(),
ObserverChatsPage(),
ObserverProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: widgetList,
        index: myIndex,  
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [ BoxShadow(color: Color.fromARGB(255, 163, 193, 186), blurRadius: 10)],
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
             myIndex= index; 
            });
          },
          currentIndex: myIndex,
          iconSize: 30,
          showUnselectedLabels: false,
          backgroundColor: Color(0xffFFFFFB),
          unselectedItemColor: Color(0xff199A8E),
          selectedItemColor: Color.fromARGB(255, 25, 117, 109),
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ]),
      ),
      
    );
}}