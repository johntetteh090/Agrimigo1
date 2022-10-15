import 'dart:ui';

class Measurements {
  String name;
  String reading;
  int index;
  //String unit;
  Color color;
  String imgName;
  List<Measurements> subMeasurements;


  Measurements({
    required this.name,
    required this.reading,
    required this.color,
    required this.imgName,
    required this.index,
    required this.subMeasurements,
  });
}
