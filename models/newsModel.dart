import 'dart:ui';

import 'package:flutter/cupertino.dart';

class MyNews {
  String content;
  Color color;
  int id;
  String imgName;
  List<MyNews> subNews;

  MyNews({
    required this.id,
    required this.content,
    required this.color,
    required this.imgName,
    required this.subNews,
  });
}
