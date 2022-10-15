import 'package:agrimigo/constants.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  //FOCUS MODE FOR LABEL TEXT
  late FocusNode nameFocusNode = new FocusNode();
  late FocusNode dobFocusNode = new FocusNode();
  late FocusNode genderFocusNode = new FocusNode();
  late FocusNode emailFocusNode = new FocusNode();
  late FocusNode phoneFocusNode = new FocusNode();


  @override
  void initState() {
    super.initState();

    nameFocusNode.addListener(() {
      setState(() {});
    });
    dobFocusNode.addListener(() {
      setState(() {});
    });
    genderFocusNode.addListener(() {
      setState(() {});
    });
    emailFocusNode.addListener(() {
      setState(() {});
    });
    phoneFocusNode.addListener(() {
      setState(() {});
    });

  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    dobFocusNode.dispose();
    genderFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();

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
                  'My Profile',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'MontserratSemiBold',
                      fontSize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Update Profile',
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
              //FULL Name
              TextFormField(
                // The validator receives the text that the user has entered.
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'FULL NAME',
                    labelStyle: TextStyle(
                      fontFamily: 'MontserratRegular',
                      fontSize: 12.0,
                      color: nameFocusNode.hasFocus
                          ? kPrimaryColor
                          : Colors.black.withOpacity(1.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: redColor)),
                    focusColor: kPrimaryColor,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    )),
                focusNode: nameFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter farm name';
                  }
                  return null;
                },
              ),
              //D.O.B
              TextFormField(
                // The validator receives the text that the user has entered.
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'DATE OF BIRTH',
                    labelStyle: TextStyle(
                      fontFamily: 'MontserratRegular',
                      fontSize: 12.0,
                      color: dobFocusNode.hasFocus
                          ? kPrimaryColor
                          : Colors.black.withOpacity(1.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: redColor)),
                    focusColor: kPrimaryColor,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    )),
                focusNode: dobFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter total area';
                  }
                  return null;
                },
              ),
              //GENDER
              TextFormField(
                // The validator receives the text that the user has entered.
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'GENDER',
                    labelStyle: TextStyle(
                      fontFamily: 'MontserratRegular',
                      fontSize: 12.0,
                      color: genderFocusNode.hasFocus
                          ? kPrimaryColor
                          : Colors.black.withOpacity(1.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: redColor)),
                    focusColor: kPrimaryColor,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                    )),
                focusNode: genderFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter country name';
                  }
                  return null;
                },
              ),
              //EMAIL
              TextFormField(
                // The validator receives the text that the user has entered.
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'E-MAIL',
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
                focusNode: emailFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city name';
                  }
                  return null;
                },
              ),
              //MOBILE NUMBER
              TextFormField(
                // The validator receives the text that the user has entered.
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'MOBILE NUMBER',
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
                focusNode: phoneFocusNode,
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
