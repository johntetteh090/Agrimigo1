import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:agrimigo/screens/dashboard.dart';
import 'package:agrimigo/screens/smart_irrigationPage.dart';
import 'package:agrimigo/screens/weather_monitoring.dart';
import 'package:agrimigo/screens/maintenancePage.dart';
class FireAlertPage extends StatelessWidget{

  final String subTitle= 'Our system alerts you whenever there is a fire '+
  'in your farm';


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
                      'assets/images/fireAlert.jpg',
                      fit: BoxFit.cover,
                      scale: 6.0,
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

                  Text('Fire Alert',
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
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Container(
                    child: new Row(
                      children: [

                        SizedBox(width:30.0),

                        // rounded dots
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.green, width: 1),
                            color: Colors.black38,
                            shape: BoxShape.circle,
                          ),
                        ),

                        SizedBox(width:5.0),


                        // dot 2
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.green, width: 1),
                            color: Colors.black38,
                            shape: BoxShape.circle,
                          ),
                        ),

                        SizedBox(width:5.0),

                        //dot 3
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 1),
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                        ),


                        SizedBox(width:5.0),
                        //dot 4
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.green, width: 1),
                            color: Colors.black38,
                            shape: BoxShape.circle,
                          ),
                        ),

                      ],
                    ),
                  ),


                  //the next button
                  Container(
                    child: new Row(
                      children: [


                        FlatButton(
                          color: Colors.transparent,
                          padding: EdgeInsets.all(6.0),
                          child: Row( // Replace with a Row for horizontal icon + text
                            children: <Widget>[

                              Text("Next",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18.0
                                ),),

                              Icon(Icons.arrow_forward),
                            ],
                          ),
                          onPressed: (){

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MaintenancePage()));
                          },
                        ),
                        SizedBox(width:30.0),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}