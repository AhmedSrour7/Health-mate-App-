import 'package:flutter/material.dart';
import 'package:health_mate/screens/doctor/doctor_sign_up_screen.dart';
import 'package:health_mate/screens/observer/observer_sign_up_screen.dart';
import 'package:health_mate/screens/patient/patient_sign_up_screen.dart';
import 'package:health_mate/widgets/button1.dart';
import 'package:health_mate/widgets/button2.dart';

class SignUpTypePage extends StatelessWidget {
  const SignUpTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8F3F1),
      body: PageView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 110,
              ),
              Image.asset('assets/images/loggo.png'),
              SizedBox(
                height: 50,
              ),
              Text(
                "Are you a:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              button(
                text: "Doctor",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DoctorSignUpPage();
                  }));
                },
              ),
              SizedBox(
                height: 20,
              ),
              button2(
                text: "Patient",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PatientSignUpPage();
                  }));
                },
              ),
              SizedBox(
                height: 20,
              ),
              button2(
                text: "Observer",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ObserverSignUpPage();
                  }));
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
