import 'package:assignment_syoft/utlis/utlis.dart';
import 'package:assignment_syoft/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  final emailforgotcontroller=TextEditingController();
  final _formfield=GlobalKey<FormState>();
  bool loading=false;

  final auth=FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
      emailforgotcontroller.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   resizeToAvoidBottomInset: false, 

     
      body: SafeArea(
        child: Column(
          
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Container(
              height: 330,
              child: Lottie.asset('asset/Animation4h.json',
              
              ),
            ),
            SizedBox(
              height: 30,
            ),
             Text("Forgot password--we got you covered ",
             style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black) ,
             
             ),
             SizedBox(
              height: 30,
            ),
            Form(
              key: _formfield,

              child: Column(
                children: [
                  TextFormField(
                    controller: emailforgotcontroller,
                    decoration: InputDecoration(
                      hintText: ' Enter Email',
                      hintStyle:GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black) ,
                      
         errorStyle:GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 65, 60, 60)) ,

                      border: OutlineInputBorder(
                        
                        borderRadius: BorderRadius.circular(30)
                      ),
                      prefixIcon: Icon(Icons.mail)
                      
                    ),
                    validator: (value){
                      
                      
                     if(value!.isEmpty){
                      return ' Email cant be empty';
                     }else{
                      return null;
                     }
                    },
                    
                  ),
               
                ],
              ),
              
            
            ),
            
               SizedBox(
              height: 30,
            ),
            RoundButton(
              loading: loading,
              title: "Send Code", 
              onTap: (){
                 if(_formfield.currentState!.validate()){
            
                  }
                  auth.sendPasswordResetEmail(email: emailforgotcontroller.text.toString()).then((value) {
                  Utlis().toastMessage('Email send to reset password');
                  }).onError((error, stackTrace){
                    Utlis().toastMessage(error.toString());
                  });
              })
            
           
              
          ],
        ),
      ),
    );
  }
}