import 'dart:ffi';

import 'package:agrimigo/models/measurements.dart';
import 'package:agrimigo/models/services.dart';
import 'package:agrimigo/screens/fireAwareness.dart';
import 'package:agrimigo/screens/humidity.dart';
import 'package:agrimigo/screens/maintenance.dart';
import 'package:agrimigo/screens/news.dart';
import 'package:agrimigo/screens/profilePage.dart';
import 'package:agrimigo/screens/signin.dart';
import 'package:agrimigo/screens/soilmoisture.dart';
import 'package:agrimigo/screens/systemGuide.dart';
import 'package:agrimigo/screens/temperature.dart';
import 'package:agrimigo/util/measurementUtils.dart';
import 'package:agrimigo/util/servicesUtil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:agrimigo/screens/manualPumpPage.dart';
import 'package:agrimigo/screens/gasPage.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Measurements> measurements = Utils.getMockedMeasurements();

  List<Services> services = Util.getMockedServices();

  List<IconData> icons = [
    Icons.directions,
    Icons.radio,
    Icons.settings_remote,
    Icons.engineering_sharp,
  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Dashboard
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Container(
                      height: 125,
                      width: 200,
                      child: Stack(
                        children: [
                          Text('dash',
                              style: TextStyle(
                                fontFamily: 'MontserratExtraBold',
                                fontSize: 40.0,
                              )),
                          Positioned(
                            top: 33.0,
                            child: Text('board',
                                style: TextStyle(
                                  fontFamily: 'MontserratExtraBold',
                                  fontSize: 40.0,
                                )),
                          ),
                          Positioned(
                            top: 62.0,
                            left: 124.0,
                            child: Container(
                              height: 10.0,
                              width: 10.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 200.0,
                          child: new ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: measurements.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              return GestureDetector(
                                onTap: (){
                                  switch (measurements[index].index) {
                                    case 0: //SOIL MOISTURE CHART PAGE
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SoilMoisturePage()));
                                      break;

                                    case 1: //HUMIDITY CHART PAGE
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HumidityPage()));
                                      break;

                                    case 2: //TEMPERATURE CHART PAGE
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TemperaturePage()));
                                      break;

                                    case 3: //GAS CHART PAGE
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GasPage()));
                                      break;

                                }},
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  height: 150,
                                  width: 180,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/images/' +
                                                measurements[index].imgName +
                                                '.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          height: 180,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                                Colors.black,
                                                Colors.black.withOpacity(0.3),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          ClipOval(
                                            child: Container(
                                              color: Colors.transparent,
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                measurements[index].reading,
                                                style: TextStyle(
                                                  fontFamily: 'MontserratBold',
                                                  color: Colors.white,
                                                  fontSize: 40,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                            child: Text(
                                              measurements[index].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: 'MontserratBlack'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  //swipe
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Row(
                      children: [
                        Text('swipe', style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'MontserratBold'
                        ),),

                        Icon(
                          Icons.compare_arrows,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),

                  //Services
                  Expanded(
                    child: new ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: services.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Center(
                          child: Container(
                            margin: EdgeInsets.symmetric( vertical: 10, horizontal: 10),
                            height: 150,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/' +
                                          services[index].imgName +
                                          '.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black,
                                          Colors.black.withOpacity(0.95),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    switch (services[index].id) {
                                      case 1: //SYSTEM GUIDE
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SystemGuide()));
                                        break;

                                      case 2: //NEWS
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => News()));
                                        break;

                                      case 3: //MANUAL PUMP
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ManualPumpPage()));
                                        break;

                                      case 4: //MAINTENANCE
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Maintenance()));
                                        break;
                                    }
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipOval(
                                        child: Container(
                                          color: services[index].color,
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            icons[index],
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Text(
                                          services[index].name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'MontserratBlack'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  //Readings



                  //Readings

                ],
              ),
            ),
          )),
    );
  }


}
