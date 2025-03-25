import 'package:flutter/material.dart';

class Case {
  final int id;
 final String title;
final  String description;
 final Color color;

  Case(
      {required this.id,
      required this.title,
      required this.description,
      required this.color});
}

class CaseCard extends StatelessWidget {
  final Case case1;
  const CaseCard({super.key, required this.case1, required this.ontap});
  final Function(int)ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(case1.id),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(8),
        color: case1.color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                case1.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(case1.description, style: TextStyle(fontSize: 16),)
            ],
          ),
        ),
      ),
    );
  }
}
