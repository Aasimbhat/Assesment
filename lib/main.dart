import 'package:assignment_syoft/view/login_signup.dart';
import 'package:assignment_syoft/view/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: const OnboardingScreen()
    );
  }
}

