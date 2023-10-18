import 'package:assignment_syoft/utlis/utlis.dart';
import 'package:assignment_syoft/view/login_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final auth=FirebaseAuth.instance;
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Container(
              margin: const EdgeInsets.only(right: 300),
              child: Icon(Icons.home_filled,color: Colors.black,size: 30,)
              ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child:IconButton(onPressed: (){
                auth.signOut().then((value){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginSignUpPage()));

             }).onError((error, stackTrace){
              Utlis().toastMessage(error.toString());
             });
              }, 
              icon: Icon(Icons.logout,size: 30,color: Colors.black,))
              ),
          ],
        ),
      ],
    ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
               Text(
              "We are pleased to have you here",
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            LottieBuilder.asset('asset/Animation3.json'),
            
          ],
        ),
      ),
    );
  }
}