import 'package:assignment_syoft/view/login_signup.dart';
import 'package:assignment_syoft/view/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
   
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginSignUpPage()
    );
  }
}

