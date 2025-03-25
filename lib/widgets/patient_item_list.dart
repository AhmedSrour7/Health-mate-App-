import 'package:flutter/material.dart';

class PatientItemList extends StatelessWidget {
  PatientItemList(
      {super.key,
      required this.name,
      required this.image,
      required this.condition});
  final String name;
  final String condition;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(0XFFDCEEEB),
                backgroundImage: AssetImage(image),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(condition),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
