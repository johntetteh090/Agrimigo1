import 'dart:async';
import 'dart:developer';

import 'package:agrimigo/screens/homepage.dart';
import 'package:agrimigo/screens/phonesignin.dart';
import 'package:agrimigo/screens/termspage.dart';
import 'package:agrimigo/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:agrimigo/constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 60.0);
  final formkey = new GlobalKey<FormState>();
  String? email, password;
  bool isLoading = false;

  //FOCUS MODE FOR LABEL TEXT
  FocusNode emailFocusNode = new FocusNode();
  FocusNode pwdFocusNode = new FocusNode();

  //Check fields during submit
  checkFields() {
    final form = formkey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }


  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {});
    });
    pwdFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    pwdFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: formkey,
            child: _buildLoginForm(),
          ),
        ),
      ),
    );
  }

  _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ListView(
        children: [
          SizedBox(
            height: 75.0,
          ),
          Container(
            height: 125,
            width: 200,
            child: Stack(
              children: [
                Text('Agri',
                    style: TextStyle(
                        fontFamily: 'MontserratBold', fontSize: 50.0)),
                Positioned(
                  top: 50.0,
                  child: Text('Migo',
                      style: TextStyle(
                          fontFamily: 'MontserratBold', fontSize: 50.0)),
                ),
                Positioned(
                  top: 87.0,
                  left: 132.0,
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
          SizedBox(
            height: 25.0,
          ),

          //EMAIL
          TextFormField(
            focusNode: emailFocusNode,
            decoration: InputDecoration(
                labelText: 'EMAIL',
                labelStyle: TextStyle(
                  fontFamily: 'MontserratRegular',
                  fontSize: 12.0,
                  color: emailFocusNode.hasFocus
                      ? kPrimaryColor
                      : Colors.black.withOpacity(1.0),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: redColor)),
                focusColor: kPrimaryColor,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                )),
            onChanged: (value) {
              this.email = value.trim();
              checkFields();
              setState(() {

              });
            },
            validator: (value) {
              Pattern pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regex = new RegExp(pattern.toString());

              log(value.toString());

              if (!regex.hasMatch(value!) || value.isEmpty)
                {
                  setState(() {

                  });
                  return 'Enter valid email';
                }
              else
                return null;
            },
          ),

          //PASSWORD
          TextFormField(
            focusNode: pwdFocusNode,
            decoration: InputDecoration(
                labelText: 'PASSWORD',
                labelStyle: TextStyle(
                  fontFamily: 'MontserratRegular',
                  fontSize: 12.0,
                  color: pwdFocusNode.hasFocus
                      ? kPrimaryColor
                      : Colors.black.withOpacity(1.0),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: redColor)),
                focusColor: kPrimaryColor,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                )),
            obscureText: true,
            onChanged: (value) {
              this.password = value;
              checkFields();
              setState(() {

              });
            },
            validator: (value) {
              if(value!.length < 8){
                return 'Enter password';
              } else{
                return null;
              }
            },
          ),

          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              //Todo
            },
            child: Container(
              alignment: Alignment(1.0, 0.0),
              padding: EdgeInsets.only(top: 15, left: 20),
              child: InkWell(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'MontserratSemiBold',
                      fontSize: 12.0,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
          SizedBox(height: 50.0),
          //LOGIN BUTTON
          isLoading
              ? LinearProgressIndicator()
              : GestureDetector(
                  onTap: () async {
                    if (checkFields()) {
                      setState(() {
                        isLoading = true;
                      });
                      var result = await AuthService()
                          .signIn(email!, password!, context);

                      if (result) {
                        Timer(Duration(seconds: 3), () {
                          log('sign in successful');
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        });
                      } else {
                        log('sign in unsuccessful');
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }else{
                     return null;
                    }
                  },
                  child: Container(
                    height: 50.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: checkFields() ?  Colors.green : Colors.grey,
                      color: checkFields() ?  Colors.green : Colors.grey,
                      elevation: 7.0,
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MontserratMedium'),
                        ),
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: 20.0,
          ),
          //PHONE BUTTON
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PhoneSignInPage()));
            },
            child: Container(
              height: 50.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: ImageIcon(
                        AssetImage(
                          'assets/images/phone.png',
                        ),
                        size: 15.0,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Center(
                      child: Text(
                        'Login with phone number',
                        style: TextStyle(fontFamily: 'MontserratBold'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'New to Agrimigo ?',
                style: TextStyle(fontFamily: 'MontserratRegular'),
              ),
              SizedBox(
                width: 5.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TermsPage()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'MontserratSemiBold',
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

 
}
