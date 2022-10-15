//TODO: GET THE VALIDATIONS TO WORK ESP SIGNING UP WITH FIELD EMPTY

import 'dart:async';
import 'dart:developer';
import 'package:agrimigo/constants.dart';
import 'package:agrimigo/screens/homepage.dart';
import 'package:agrimigo/screens/signin.dart';
 import 'package:agrimigo/services/authservice.dart';
 import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formkey = new GlobalKey<FormState>();
  String email = '',
      password = '',
      phoneNumber = '',
      fullName = '',
      confirmPassword = '';

  bool isLoading = false;

  //FOCUS MODE FOR LABEL TEXT
  FocusNode emailFocusNode = new FocusNode();
  FocusNode pwdFocusNode = new FocusNode();
  FocusNode fullNameFocusNode = new FocusNode();
  FocusNode confirmPwdFocusNode = new FocusNode();
  FocusNode phoneFocusNode = new FocusNode();

  //Check fields during submit
  checkFields() {
    final form = formkey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To validate email
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());

    if (!regex.hasMatch(value))
      return 'Enter valid email';
    else
      return validateEmail(value);
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
    fullNameFocusNode.addListener(() {
      setState(() {});
    });
    phoneFocusNode.addListener(() {
      setState(() {});
    });
    confirmPwdFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    pwdFocusNode.dispose();
    phoneFocusNode.dispose();
    fullNameFocusNode.dispose();
    confirmPwdFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: formkey,
            child: _buildSignUpForm(),
          ),
        ),
      ),
    );
  }

  _buildSignUpForm() {
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
                Text('Sign',
                    style: TextStyle(
                        fontFamily: 'MontserratBold', fontSize: 50.0)),
                Positioned(
                  top: 50.0,
                  child: Text('Up',
                      style: TextStyle(
                          fontFamily: 'MontserratBold', fontSize: 50.0)),
                ),
                Positioned(
                  top: 87.0,
                  left: 80.0,
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

          //FULL NAME
          TextFormField(
            focusNode: fullNameFocusNode,
            decoration: InputDecoration(
                labelText: 'FULL NAME',
                labelStyle: TextStyle(
                  fontFamily: 'MontserratRegular',
                  fontSize: 12.0,
                  color: fullNameFocusNode.hasFocus
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
              this.fullName = value.trim();
              checkFields();
              setState(() {});
            },
            validator: (value) {
              String pattern = r'^[a-z A-Z,.\-]+$';
              RegExp regExp = new RegExp(pattern);
              if (fullName.length == 0) {
                return 'Please enter full name';
              } else if (!regExp.hasMatch(fullName)) {
                return 'Please enter valid full name';
              }
              return null;
            },
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
              setState(() {});
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email field is required';
              }

              const pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              final regExp = RegExp(pattern);

              if (!regExp.hasMatch(value)) {
                return 'Enter a valid email';
              } else
                return null;
            },
          ),

          //PHONE NUMBER
          TextFormField(
            focusNode: phoneFocusNode,
            decoration: InputDecoration(
                labelText: 'PHONE NUMBER',
                labelStyle: TextStyle(
                  fontFamily: 'MontserratRegular',
                  fontSize: 12.0,
                  color: phoneFocusNode.hasFocus
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
              this.phoneNumber = value.trim();
              checkFields();
              setState(() {});
            },
            validator: (value) {
              String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
              RegExp regExp = new RegExp(pattern);
              if (value!.length == 0) {
                return 'Please enter phone number';
              } else if (!regExp.hasMatch(value)) {
                return 'Please enter valid phone number';
              }
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
              this.password = value.trim();
              checkFields();
              setState(() {});
            },
            validator: (value) {
              if (value!.isEmpty)
                return 'Enter valid password';
              else
                return null;
            },
          ),

          //CONFIRM PASSWORD
          TextFormField(
            focusNode: confirmPwdFocusNode,
            decoration: InputDecoration(
                labelText: 'CONFIRM PASSWORD',
                labelStyle: TextStyle(
                  fontFamily: 'MontserratRegular',
                  fontSize: 12.0,
                  color: confirmPwdFocusNode.hasFocus
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
              this.confirmPassword = value.trim();
              checkFields();
              setState(() {});
            },
            validator: (value) {
              if (value!.isEmpty)
                return 'Please confirm password';
              else if (value != password)
                return 'Password does not match';
              else
                return null;
            },
          ),

          SizedBox(
            height: 50.0,
          ),
          //SIGN UP BUTTON
          isLoading
              ? LinearProgressIndicator()
              : GestureDetector(
                  onTap: () async {
                    if (checkFields()) {
                     /* setState(() {
                        isLoading = true;
                      });*/
                      Fluttertoast.showToast(msg: 'didnt get here');
                      var result = await AuthService().signUp(email, password);

                      if (result) {
                        Timer(Duration(seconds: 3), () {
                          log('sign in successful');
                         setState(() {
                        isLoading = true;
                      });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));


                        });
                      } else {
                        log('sign in unsuccessful');
                      Fluttertoast.showToast(msg: 'didnt get here');
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                  child: Container(
                    height: 50.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: checkFields() ? Colors.green : Colors.grey,
                      color: checkFields() ? Colors.green : Colors.grey,
                      elevation: 7.0,
                      child: Center(
                        child: Text(
                          'SIGN UP',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(fontFamily: 'MontserratRegular'),
              ),
              SizedBox(
                width: 5.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                },
                child: Text(
                  'Sign in',
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
