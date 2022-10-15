import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Services {
  String name;
  Color color;
  int id;
  String imgName;
  List<Services> subServices;

  Services({
    required this.id,
    required this.name,
    required this.color,
    required this.imgName,
    required this.subServices,
  });
}
