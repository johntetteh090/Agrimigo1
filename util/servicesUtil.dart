import 'dart:developer';

import 'package:agrimigo/models/services.dart';
import 'package:flutter/material.dart';
class Util{
  static List<Services> getMockedServices(){
    return [
      Services(
          color: Colors.green,
          name: "System Guide",
          imgName: "guide",
          id: 1,
          subServices: []
      ),
      Services(
          color: Colors.blue,
          name: "News",
          imgName: "news",
          id: 2,
          subServices: []
      ),
      Services(
          color: Colors.green,
          name: "Remote Control",
          imgName: "fire",
          id: 3,
          subServices: []
      ),
      Services(
          color: Colors.deepPurple,
          name: "System Maintenance",
          imgName: "sysmtn",
          id: 4,
          subServices: []
      ),
    ];
  }
}