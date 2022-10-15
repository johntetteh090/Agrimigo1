import 'dart:async';
import 'dart:developer';

import 'package:agrimigo/constants.dart';
import 'package:agrimigo/screens/homepage.dart';
import 'package:agrimigo/screens/signin.dart';
import 'package:agrimigo/services/authservice.dart';
import 'package:flutter/material.dart';

class MyFarm extends StatefulWidget {
  const MyFarm({Key? key}) : super(key: key);



  @override
  _MyFarmState createState() => _MyFarmState();
}

class _MyFarmState extends State<MyFarm> {


  final _formKey = GlobalKey<FormState>();

  //FOCUS MODE FOR LABEL TEXT
  late FocusNode farmNameFocusNode = new FocusNode();
  late FocusNode totalAreaFocusNode = new FocusNode();
  late FocusNode countryFocusNode = new FocusNode();
  late FocusNode cityFocusNode = new FocusNode();
  late FocusNode zipFocusNode = new FocusNode();


  @override
  void initState() {
    super.initState();

    farmNameFocusNode.addListener(() {
      setState(() {});
    });
    totalAreaFocusNode.addListener(() {
      setState(() {});
    });
    countryFocusNode.addListener(() {
      setState(() {});
    });
    cityFocusNode.addListener(() {
      setState(() {});
    });
    zipFocusNode.addListener(() {
      setState(() {});
    });

  }

  @override
  void dispose() {
    farmNameFocusNode.dispose();
    totalAreaFocusNode.dispose();
    countryFocusNode.dispose();
    cityFocusNode.dispose();
    zipFocusNode.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: _buildSignUpForm(),
      ),
    );
  }

  _buildSignUpForm() {
    return ListView(
      children: [
        Container(
          height: 100,
          color: Colors.black,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Farm Details',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'MontserratSemiBold',
                      fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Update Farm Details',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'MontserratThin',
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              //Farm Name
              TextFormField(
                // The validator receives the text that the user has entered.
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'FARM NAME',
                    labelStyle: TextStyle(
                      fontFamily: 'MontserratRegular',
                      fontSize: 12.0,
                      color: farmNameFocusNode.hasFocus
                          ? kPrimaryColor
                          : Colors.black.withOpacity(1.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: redColor)),
                    focusColor: kPrimaryColor,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    )),
                focusNode: farmNameFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter farm name';
                  }
                  return null;
                },
              ),
              //Total Area
              TextFormField(
                // The validator receives the text that the user has entered.
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'TOTAL AREA',
                    labelStyle: TextStyle(
                      fontFamily: 'MontserratRegular',
                      fontSize: 12.0,
                      color: totalAreaFocusNode.hasFocus
                          ? kPrimaryColor
                          : Colors.black.withOpacity(1.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: redColor)),
                    focusColor: kPrimaryColor,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    )),
                focusNode: totalAreaFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter total area';
                  }
                  return null;
                },
              ),
              //Country
              TextFormField(
                // The validator receives the text that the user has entered.
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'COUNTRY',
                    labelStyle: TextStyle(
                      fontFamily: 'MontserratRegular',
                      fontSize: 12.0,
                      color: countryFocusNode.hasFocus
                          ? kPrimaryColor
                          : Colors.black.withOpacity(1.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: redColor)),
                    focusColor: kPrimaryColor,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    )),
                focusNode: countryFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter country name';
                  }
                  return null;
                },
              ),
              //City
              TextFormField(
                // The validator receives the text that the user has entered.
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'CITY',
                    labelStyle: TextStyle(
                      fontFamily: 'MontserratRegular',
                      fontSize: 12.0,
                      color: cityFocusNode.hasFocus
                          ? kPrimaryColor
                          : Colors.black.withOpacity(1.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: redColor)),
                    focusColor: kPrimaryColor,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    )),
                focusNode: cityFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city name';
                  }
                  return null;
                },
              ),
              //Zip
              TextFormField(
                // The validator receives the text that the user has entered.
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'ZIP/POSTAL CODE',
                    labelStyle: TextStyle(
                      fontFamily: 'MontserratRegular',
                      fontSize: 12.0,
                      color: zipFocusNode.hasFocus
                          ? kPrimaryColor
                          : Colors.black.withOpacity(1.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: redColor)),
                    focusColor: kPrimaryColor,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    )),
                focusNode: zipFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter zip/postal code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50,),

              //save button
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Container(
                  height: 50.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                    elevation: 7.0,
                    child: Center(
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'MontserratMedium'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


}


