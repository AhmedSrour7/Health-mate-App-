import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeasurementCardPatient extends StatelessWidget {
  MeasurementCardPatient(
      {super.key,
      required this.title,
      required this.image,
      required this.data});
  final String title;
  final String data;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 4,
      child: Container(
        padding: EdgeInsets.all(9),
        height: 137,
        width: 160,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    data.toString(),
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 15, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Image(
              image: AssetImage(image),
            )),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

class MeasurementCard extends StatelessWidget {
  MeasurementCard({super.key, required this.title, required this.image});
  final String title;

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      height: 137,
      width: 160,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          alignment: Alignment(0.8, 0),
          image: AssetImage(image),
        ),
      ),
    );
  }
}
