import 'package:flutter/material.dart';
import 'package:health_mate/screens/patient/patient_ai_result_screen.dart';

class roboDocCard extends StatelessWidget {
  roboDocCard({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PatientAiResultPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.all(8.0),
           decoration: BoxDecoration(
               color: Colors.white,

               borderRadius: BorderRadius.circular(25)
           ),
          child: Column(
            children: [
              Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.contain,
                  ),
                ),

              ),
              Text(
                text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
