import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class onboardingContent extends StatelessWidget {
  const onboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
                    
        Text(title,
        style: GoogleFonts.poppins(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.black,),
        textAlign: TextAlign.center,),
         Text(description,
        style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.black,),
        textAlign: TextAlign.center
        ),
                    

        Lottie.asset( image,height: 500),
        

      ],
    );
  }
}