import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:agrimigo/screens/dashboard.dart';
import 'package:agrimigo/screens/smart_irrigationPage.dart';

class WeatherMonitoringPage extends StatelessWidget{

  final String subTitle= 'Get to know the weather within your geographical'+
  'setting. Make informed decisions';

  //When you come, try the homepage integration

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: new Column(
            children: [

              SizedBox(height: 15.0,),
              //The skip button
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [


                  Container(
                    width:70.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 1),
                        borderRadius: BorderRadius.circular(6.0),
                        //color: Colors.yellow,
                        shape: BoxShape.rectangle,
                      ),
                      child: InkWell(
                        onTap: (){

                        },
                        child: MaterialButton(
                            //color: Colors.transparent,
                            child: Text('SKIP',
                              style: TextStyle(color: Colors.green,fontSize: 14.0),),
                            onPressed: (){

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                            }
                        ),
                      )
                  ),

                  SizedBox(
                    width: 30.0,
                    height: 10.0,
                  ),
                ],
              ),

              SizedBox(
                //width: 10.0,
                height: 75.0,
              ),
              //The image
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                 // SizedBox(width: 15.0,),

                     Image.asset(
                      'assets/images/weather_monitoring.jpg',
                      fit: BoxFit.cover,
                      scale: 5.0,
                    ),

                  //SizedBox(width: 15.0,),
                ],
              ),

              SizedBox(height: 8.0,),
              //Title Text
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //SizedBox(width: 15.0,),

                  Text('Weather Monitoring',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20.0),
                  ),
                  //SizedBox(width: 15.0,),
                ],
              ),

              SizedBox(height: 8.0,),

              //sub Title Text
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(width: 35.0,),
                  Expanded(
                      child: Text(subTitle,
                        style: TextStyle(color: Colors.black38,fontSize: 16.0),)
                  ),
                  SizedBox(width: 35.0,),
                ],
              ),

              SizedBox(height:40.0),

              //The button and round dot
              /*new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [



                ],
              )*/
              Expanded(
                  child: Center(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                      },
                      textColor: Colors.white,
                      color: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: 200,
                        decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                              colors: [
                                Colors.white38,
                                Colors.green
                              ],
                            ),
                          borderRadius: BorderRadius.circular(6.0)
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Get Started",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize:18.0,fontWeight: FontWeight.w400,),
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}