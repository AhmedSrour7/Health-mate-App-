import 'package:flutter/material.dart';
import 'package:health_mate/screens/patient/burnsdetails.dart';
import 'package:health_mate/screens/patient/chokingdetails.dart';
import 'package:health_mate/screens/patient/headinjurydetails.dart';
import 'package:health_mate/screens/patient/poisoningdetails.dart';
import 'package:health_mate/screens/patient/severebleedingdetails.dart';

import '../../widgets/case_card.dart';

class FirstAidPage extends StatefulWidget {
  const FirstAidPage({super.key});

  @override
  State<FirstAidPage> createState() => _FirstAidPageState();
}

class _FirstAidPageState extends State<FirstAidPage> {
  List<Case> cases = [
    Case(
      id: 1,
      title: ' Burns ',
      description: ' Case 1 ',
      color: Color(0XFFC8F1E3),
    ),
    Case(
      id: 2,
      title: ' Head injury ',
      description: ' Case 2  ',
      color: Color(0XFFC0E7CD),
    ),
    Case(
      id: 3,
      title: ' Choking',
      description: ' Case 3 ',
      color: Color(0XFF5FB391),
    ),
    Case(
      id: 4,
      title: ' Poisoning ',
      description: ' Case 4 ',
      color: Color(0XFF7FD0C3),
    ),
    Case(
      id: 5,
      title: ' Severe bleeding ',
      description: ' Case 5  ',
      color: Color(0XFF6EBF94),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          ' First Aid ',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Color(0XFFDCEEEB),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          // searchBar(),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 150,
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/images/firstaid.png'),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: cases.length,
              itemBuilder: (context, index) {
                return CaseCard(
                  case1: cases[index],
                  ontap: (int caseId) {
                    switch (caseId) {
                      case 1:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BurnsDetails();
                        }));
                      case 2:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HeadInjuryDetails();
                        }));
                      case 3:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ChokingDetails();
                        }));
                      case 4:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PoisoningDetails();
                        }));
                      case 5:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SeverebleedingDetails();
                        }));
                    }
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
