import 'package:flutter/material.dart';
import 'package:health_mate/screens/doctor/doctor_patient_measures_screen.dart';

import '../bloc/doctor/doctor_cubit.dart';

class card extends StatelessWidget {
  card(
      {super.key,
      required this.name,
      required this.condition,
        required this.patientEmail,

        required this.image});
  final String name;
  final String condition;
  final String image;
  final String patientEmail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DoctorCubit.get(context).getPatientDetails(patientEmail: patientEmail);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DoctorPatientMeasurePage();
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          height: 85,
          width: 380,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Row(
            children: [
              SizedBox(
                width: 25,
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(image),
              ),
              SizedBox(
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(condition, style: TextStyle(fontSize: 17)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
