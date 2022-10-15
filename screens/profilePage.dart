import 'package:agrimigo/screens/editProfile.dart';
import 'package:agrimigo/screens/language.dart';
import 'package:agrimigo/screens/myFarm.dart';
import 'package:agrimigo/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Todo: Fetch Farmer's name from database
                      Text(
                        'Sussan Agams',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MontserratSemiBold',
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Farmer',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MontserratThin',
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 20),
                      child: Container(
                        height: 72.0,
                        width: 72.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 15,
                      child: ImageIcon(
                        AssetImage(
                          'assets/images/farmericon.png',
                        ),
                        //color: Colors.green,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),

          //My Profile
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfile()));
            },
            child: Card(
              child: ListTile(
                title: Text(
                  'My Profile',
                  style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 16),
                ),
                subtitle: Text(
                  'Complete or update your profile',
                  style: TextStyle(fontFamily: 'MontserratLight', fontSize: 14),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                      size: 20,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 15,
          ),
          //My Farm
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyFarm()));
            },
            child: Card(
              child: ListTile(
                title: Text(
                  'My Farm',
                  style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 16),
                ),
                subtitle: Text(
                  'Update your farm details',
                  style: TextStyle(fontFamily: 'MontserratLight', fontSize: 14),
                ),
                trailing: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.black,
                      size: 20,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //Language
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Language()));
            },
            child: Card(
              child: ListTile(
                title: Text(
                  'Change Language',
                  style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 16),
                ),
                subtitle: Text(
                  'Select another language',
                  style: TextStyle(fontFamily: 'MontserratLight', fontSize: 14),
                ),
                trailing:Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.black,
                      size: 20,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //Logout
          InkWell(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                      (route) => true);
            },
            child: Card(
              child: ListTile(
                title: Text(
                  'Log out',
                  style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 16),
                ),
                subtitle: Text(
                  'Exit App',
                  style: TextStyle(fontFamily: 'MontserratLight', fontSize: 14),
                ),
                trailing: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                          Icons.logout,
                          color: Colors.red,
                          size: 20,
                        ),
                  ),
                ),
              ),
          ),

        ],
      ),
    );
  }
}
