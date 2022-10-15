import 'package:agrimigo/util/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:agrimigo/screens/homepage.dart';
import 'package:agrimigo/screens/signin.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AuthService{
  //Determine if the user is authenticated

  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot){
        if(snapshot.hasData){
          return HomePage();
        } else
          return SignInScreen();
      },
    );
  }

  //Sign out
  signOut(){
    FirebaseAuth.instance.signOut();
  }

  //Sign In
  Future<bool> signIn(String email, String password, context) async {
   try{
    await FirebaseAuth.instance
         .signInWithEmailAndPassword(email: email, password: password)
         .then((value) => print ('signed in')).catchError((e){
       ErrorHandler().errorDialog(context, e);
     });

     return true;
   }catch(e){
     return false;

   }

    return false;
  }

  //SignUp a new user
 Future<bool> signUp(String email, String password) async {
   try{
   await  FirebaseAuth.instance
         .createUserWithEmailAndPassword(email: email, password: password);
     return true;
   }catch(e){
     return false;
   }
  }
}