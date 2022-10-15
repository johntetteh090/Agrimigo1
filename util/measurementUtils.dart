import 'package:agrimigo/models/measurements.dart';
import 'package:flutter/material.dart';
class Utils{
  static List<Measurements> getMockedMeasurements(){
    return [
      Measurements(
        color: Colors.brown,
        name: "Soil Moisture",
        imgName: "moisture",
        reading: '20'+'%',
        index: 0,
        subMeasurements: [],
       ),
      Measurements(
          color: Colors.blueAccent,
          name: "Humidity",
          imgName: "humidity",
          reading: '50'+'%',
          index: 1,
          subMeasurements: [],
      ),

      Measurements(
          color: Colors.deepOrange,
          name: "Temperature",
          imgName: "temp",
          index: 2,
          reading: '30'+'°C',
          subMeasurements: [],
      ),

      Measurements(
        color: Colors.deepOrange,
        name: "Gas",
        imgName: "gas",
        index: 3,
        reading: '30'+'mol',
        subMeasurements: [],
      ),

      Measurements(
        color: Colors.deepOrange,
        name: "Fire",
        imgName: "fire",
        index: 4,
        reading: '30'+'K',
        subMeasurements: [],
      ),

    ];
  }
}