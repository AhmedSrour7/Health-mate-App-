import 'package:collection/collection.dart';

class EcgPoints {
  final double x;
  final double y;

  EcgPoints({required this.x, required this.y});
}

List<EcgPoints> getecgPoints(List<dynamic> points) {
  // final myString = "92, 68, 84, 90, 80, 68, 83, 80, 100, 71";
  // final mylist = myString.split(',').map(double.parse).toList();
  // final data = [92, 68, 84, 90, 80, 68, 83, 80, 100, 71];
  return points
      .mapIndexed(((index, element) =>
          EcgPoints(x: index.toDouble(), y: element.toDouble())))
      .toList();
}
