import 'package:agrimigo/constants.dart';
import 'package:agrimigo/screens/signup.dart';
import 'package:flutter/material.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Summary Terms and Conditions',
          style: TextStyle(fontFamily: 'MontserratBold', fontSize: 16),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
            child: Container(
              height: 50.0,
              child: Material(
                //borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0),  ),
                //shadowColor: Colors.greenAccent,
                color: Colors.black,
                elevation: 7.0,
                child: Center(
                  child: Text(
                    'AGREE AND CONTINUE',
                    style: TextStyle(
                        color: Colors.green, fontFamily: 'MontserratBold'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  child: Text(
                    'By using Agrimigo, operated by ZiKen Tech, you accept the Terms and Conditions of Use and the Privacy Policy for Data Use.',
                    style: TextStyle(color: Colors.black),
                  ),
                ),

                //MAIN POINTS
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  //height: 50,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'MAIN POINTS',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'MontserratBold',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: 2.0,
                        width: 70.0,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),

                //SERVICES
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  //height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          '1. SERVICES',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'MontserratSemiBold',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Text(
                          terms,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              //fontFamily: 'MontserratSemiBold',
                              ),
                        ),
                      ),
                    ],
                  ),
                ),

                //USER ACCOUNTS
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  //height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          '2. USER ACCOUNTS',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'MontserratSemiBold',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Text(
                          terms,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              //fontFamily: 'MontserratSemiBold',
                              ),
                        ),
                      ),
                    ],
                  ),
                ),

                //INTELLECTUAL PROPERTY
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  //height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          '3. INTELLECTUAL PROPERTY',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'MontserratSemiBold',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Text(
                          terms,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            //fontFamily: 'MontserratSemiBold',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //DELETE ACCOUNT
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  //height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          '4. DELETE ACCOUNT',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'MontserratSemiBold',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Text(
                          terms,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            //fontFamily: 'MontserratSemiBold',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //CONTACT US
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  //height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'CONTACT US',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'MontserratBold',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Text(
                          contactmsg,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            //fontFamily: 'MontserratSemiBold',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 25.0,
                ),


               ],
            ),
          ),
        ),
      ),
    );
  }
}
