import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SystemGuide extends StatefulWidget {
  const SystemGuide({Key? key}) : super(key: key);

  @override
  _SystemGuideState createState() => _SystemGuideState();
}

class _SystemGuideState extends State<SystemGuide> {
  
  PageController _pageController= new PageController(initialPage: 0);

  List<String>images=[
    'assets/images/mobileIntegration.jpg',
    'assets/images/smartIrrigation.jpg',
    'assets/images/fireAlert.jpg',
    'assets/images/weather_monitoring.jpg',
    'assets/images/maintenance.jpg',
  ];

  List<String>title=[
    'mobile Integration',
    'smart Irrigation',
    'Fire Alert',
    'Weather Monitoring',
    'Maintenance'
  ];

  List<String>description=[
    ' Get access to your farm using your mobile phone. Command and control your farm smartly.It allows you to be in the field and the farm at the same time.',
    'Get to control farming activities within your geographical setting using automated and manual irrigation systems',
    'Our system alerts you whenever there is a fire in your farm',
    'Get to know the weather within your geographical setting. Make informed decisions',
    'Maintenance starts at 20th August 2021',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: new Column(
            children: [

              SizedBox(height: 8.0,),
              IconButton(
                  icon: Icon(Icons.keyboard_backspace,color: Colors.black,),
                  onPressed: (){
                    Navigator.pop(context);
                  }
              ),
              //swipe
              Padding(
                padding: const EdgeInsets.only(top:20.0,left: 20, bottom: 20),
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


              //The swipe action
              Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: images.length,
                    itemBuilder: (context,index){

                      return new Column(
                        children: [

                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              // SizedBox(width: 15.0,),

                              Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                                scale: 4.0,
                              ),

                              //SizedBox(width: 15.0,),
                            ],
                          ),

                          SizedBox(height: 8.0,),

                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              //SizedBox(width: 15.0,),

                              Text(title[index],
                                style: TextStyle(color: Colors.black,
                                    fontWeight: FontWeight.w600,fontSize: 20.0),
                              ),
                              //SizedBox(width: 15.0,),
                            ],
                          ),

                          SizedBox(height: 8.0,),

                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SizedBox(width: 35.0,),
                              Expanded(
                                  child: Text(description[index],
                                    style: TextStyle(color: Colors.black38,fontSize: 16.0),)
                              ),
                              SizedBox(width: 35.0,),
                            ],
                          ),

                          //SizedBox(height:40.0),

                        ],
                      );
                    },
                    onPageChanged: (i) {

                    },
                  )
              )

            ],
          )
      )
    );
  }
}
