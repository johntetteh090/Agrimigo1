import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ManualPumpPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return PumpPage();
  }
}

class PumpPage extends State<ManualPumpPage> with TickerProviderStateMixin{

  final String text='Press on this button to  manually'+
  ' irrigate the your farm';

  bool start=false;
  late AnimationController _controller;
  late AnimationController _controller1;
  late AnimationController back_controller;
  late Animation<Offset>  animation;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: CupertinoColors.secondaryLabel,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: CupertinoColors.secondaryLabel,
        leading: SlideTransition(
          position: animation,
          child: IconButton(icon: Icon(CupertinoIcons.back,color: Colors.white,),
              onPressed: (){

            Navigator.pop(context);
              }
          ),
        ),
        actions: [

          Center(
            child: Text('Remote Control',
              style: TextStyle(fontWeight: FontWeight.w600,
                  fontSize: 20.0,color: Colors.white),),
          ),
          SizedBox(width: 12.0,)
        ],
      ),
      body: SafeArea(
        child: new Column(
          children: [

            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 45.0,vertical: 30.0),
                child: Text(text,
                  style: TextStyle(color: Colors.white,
                      fontSize: 14.0),),
              )
            ),

            //the button
            (start==false)
            ?
            StartButton()
            :
            falseButton()


          ],
        ),
      )
    );
  }

  Widget falseButton() {

    return Expanded(
        child: Center(
          child: GestureDetector(
            onTap: (){

              setState(() {
                start=false;

                startAnimation();
                //_controller1..repeat();
                _controller1..reverse(from: 10.0);
                //_controller1.forward();
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.height/4.3,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                border:  Border.all(color: Colors.brown, width: 7),
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('STOP',
                    style: TextStyle(fontSize: 26.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),

                  //Spacer(),
                  SizedBox(height: 6.0,),
                  RotationTransition(
                      turns: _controller,
                    child: Icon(CupertinoIcons.settings,size: 40.0,color: Colors.white,),
                  )

                ],
              ),
            ),
          )
        )
    );
  }

  Widget StartButton() {

    return Expanded(
        child: Center(
          child: GestureDetector(
            onTap: (){
              setState(() {
                start=true;

                stopAnimation();
                _controller..repeat();
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.height/4.3,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                border:  Border.all(color: Colors.green, width: 7),
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('START',
                    style: TextStyle(fontSize: 26.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),

                  //Spacer(),
                  SizedBox(height: 6.0,),
                  RotationTransition(

                      turns: _controller1,
                    child: Icon(CupertinoIcons.settings,size: 40.0,color: Colors.white,),
                  )

                ],
              ),
            ),
          )
        )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stopAnimation();
    startAnimation();
    backAnimation();
  }
  void stopAnimation() {

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
  }

  void startAnimation() {

    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  void backAnimation() {
    back_controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    animation = Tween<Offset>(begin: Offset(4.0, 0.0), end: Offset.zero)
        .animate(
        CurvedAnimation(
        parent: back_controller,
        curve: Curves.elasticOut)
    );



    back_controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    back_controller.dispose();
    _controller1.dispose();
    _controller.dispose();
  }
}