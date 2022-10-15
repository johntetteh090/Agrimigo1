import 'package:agrimigo/screens/chats.dart';
import 'package:agrimigo/screens/dashboard.dart';
import 'package:agrimigo/screens/help.dart';
import 'package:agrimigo/screens/profilePage.dart';
import 'package:agrimigo/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static const List<Widget> _pages = <Widget>[
    Dashboard(),
    Help(),
    Chats(),
    // Camera page
    // Chats page
  ];

  int _selectedIndex = 0;
  int buttonSelected = 0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: false,
          //bottomNavigationBar:
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.shifting,
            selectedFontSize: 12,
            selectedIconTheme: IconThemeData(color: Colors.green, size: 40),
            selectedItemColor: Colors.green,
            selectedLabelStyle: TextStyle(fontFamily: 'MontserratBold'),
            unselectedLabelStyle: TextStyle(fontFamily: 'MontserratRegular'),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.live_help),
                  label: 'Help'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_alert),
                  label: 'Alerts'
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          appBar: AppBar(
            leading: Container(),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: <Widget>[
               Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        buttonSelected = 2;
                      });
                    },
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                      icon: ImageIcon(
                        AssetImage('assets/images/farmericon.png'),
                        size: 25,
                        color:buttonSelected == 2 ? Colors.green : Colors.black,
                      ),
                    ),
                  )),
              InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                        (route) => true);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                  ))
            ],
          ),
          body: _pages.elementAt(_selectedIndex),
    ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
