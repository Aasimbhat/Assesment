import 'dart:async';

import 'package:assignment_syoft/view/dashboard.dart';
import 'package:assignment_syoft/view/login_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashService{
  
  void isLogin(BuildContext,context){

    final auth=FirebaseAuth.instance;
  final user=auth.currentUser;
  if(user!=null){
    Timer(Duration(seconds: 3), () {
Navigator.push(context, MaterialPageRoute(builder: (context)=>const DashBoard()));
     }
     );
  }else{
    Timer(Duration(seconds: 3), () {
Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginSignUpPage())
);
     }
     );
    
    
  }
  }
}