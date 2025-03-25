import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:health_mate/models/linearchart.dart';

class Charts extends StatelessWidget {
  final List<EcgPoints> ecgPoints;
  const Charts({super.key, required this.ecgPoints});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: 5 / 4,
        child: Stack(
          children: [
            LineChart(LineChartData(
                maxY: 100,
                minY: 5,
                backgroundColor: Colors.white,
                borderData: FlBorderData(
                  show: false,
                ),
                gridData: FlGridData(
                  show: false,
                ),
                titlesData: FlTitlesData(
                  show: false,
                ),
                lineBarsData: [
                  LineChartBarData(
                      color: Colors.redAccent,
                      isCurved: true,
                      spots: ecgPoints
                          .map((element) => FlSpot(element.x, element.y))
                          .toList()),
                ])),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Heart Elctricity',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
