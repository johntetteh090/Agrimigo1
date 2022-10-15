import 'package:agrimigo/constants.dart';
import 'package:agrimigo/screens/homepage.dart';
import 'package:agrimigo/screens/signin.dart';
import 'package:agrimigo/screens/termspage.dart';
import 'package:flutter/material.dart';

class PhoneSignInPage extends StatefulWidget {
  const PhoneSignInPage({Key? key}) : super(key: key);

  @override
  _PhoneSignInPageState createState() => _PhoneSignInPageState();
}

class _PhoneSignInPageState extends State<PhoneSignInPage> {
  final formkey = new GlobalKey<FormState>();
  String? phone, password;

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
                labelText: 'PHONE NUMBER',
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
              this.phone = value;
            },
            validator: (value) {
              Pattern pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regex = new RegExp(pattern.toString());

              if (!regex.hasMatch(value!) && value.isEmpty)
                return 'Enter valid phone number';
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
            },
            validator: (value) {
              value!.isEmpty ? pwdMsg() : nullMsg();
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
          SizedBox(
            height: 50.0,
          ),
          //LOGIN BUTTON
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              height: 50.0,
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                shadowColor: Colors.greenAccent,
                color: Colors.green,
                elevation: 7.0,
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'MontserratMedium'),
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
                  MaterialPageRoute(builder: (context) => SignInScreen()));
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
                          'assets/images/mail.png',
                        ),
                        size: 15.0,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Center(
                      child: Text(
                        'Login with email',
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
              Text('New to Agrimigo ?',
                style: TextStyle(
                    fontFamily: 'MontserratRegular'
                ),
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
                      decoration: TextDecoration.underline
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
