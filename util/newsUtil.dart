import 'dart:developer';
import 'package:agrimigo/models/newsModel.dart';
import 'package:flutter/material.dart';
class Util{
  static List<MyNews> getMockedMyNews(){
    return [
      MyNews(
          color: Colors.green,
          content: "International Fund for Agricultural Development (IFAD)’s new investment programme to boost private funding of rural businesses and small-scale farmers",
          imgName: "guide",
          id: 1,
          subNews: []
      ),
      MyNews(
          color: Colors.blue,
          content: "News",
          imgName: "news",
          id: 2,
          subNews: []
      ),
      MyNews(
          color: Colors.red,
          content: "Fire Awareness Training",
          imgName: "fire",
          id: 3,
          subNews: []
      ),
      MyNews(
          color: Colors.deepPurple,
          content: "System Maintenance",
          imgName: "sysmtn",
          id: 4,
          subNews: []
      ),
    ];
  }
}