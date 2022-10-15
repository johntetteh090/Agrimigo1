import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [

            Container(
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                    ),
                  ]),
              child: new Column(
                children: [

                  Center(
                    child: Text('Fire',
                    style: TextStyle(fontSize: 21.0,
                        color: Colors.black,fontWeight: FontWeight.w600 ),),
                  ),

                  Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.black26,
                  ),

                  SizedBox(height: 4.0,),
                  Text('Fire was detected at 12:30pm on March 19,2021',
                      style: TextStyle(color: Colors.black45)
                  )
                ],
              ),
            ),

            //second one
            Container(
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                    ),
                  ]),
              child: new Column(
                children: [

                  Center(
                    child: Text('Gas',
                      style: TextStyle(fontSize: 21.0,
                          color: Colors.black,fontWeight: FontWeight.w600 ),),
                  ),

                  Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.black26,
                  ),

                  SizedBox(height: 4.0,),
                  Text('Gas  detected at a dangerous level at 11:00pm on April 21,2021',
                      style: TextStyle(color: Colors.black45)
                  )
                ],
              ),
            ),


            //third one
            Container(
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                    ),
                  ]),
              child: new Column(
                children: [

                  Center(
                    child: Text('Irrigation',
                      style: TextStyle(fontSize: 21.0,
                          color: Colors.black,fontWeight: FontWeight.w600 ),),
                  ),

                  Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.black26,
                  ),

                  SizedBox(height: 4.0,),
                  Text('Irrigation activity on Friday at 09:10am on May 04,2021',
                  style: TextStyle(color: Colors.black45),)
                ],
              ),
            ),


          ],
        )
      )
    );
  }

}
