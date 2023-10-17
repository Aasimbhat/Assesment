import 'package:assignment_syoft/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginSignUpPage extends StatefulWidget {
  const LoginSignUpPage({super.key});

  @override
  State<LoginSignUpPage> createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController=TextEditingController();
    final TextEditingController passwordController=TextEditingController();
      final _formfield = GlobalKey<FormState>();

    return Scaffold(
              resizeToAvoidBottomInset: false, 

      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Lottie.asset('asset/Animation4.json'),
          Text("Welcome To Syoft",
        style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.black,),
      ),
       Text("We are pleased to have you here",
        style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black,),
      ),
      SizedBox(
        height: 30,
      ),
     RoundButton(title: 'Login', 
     onTap: (){
         showModalBottomSheet(
          
            context: context,
           builder: (context){
            return Container(
           height: 650,
           decoration: BoxDecoration(
            color: Color.fromARGB(255, 211, 207, 207),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30) )
           ),
           child:Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text("Login",
               style:GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.black,),),
              SizedBox(
                height: 20,
                
              ),
              Form(
                 key: _formfield,

                child: Column(
                  children: [
                    TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black) ,
                                 errorStyle:GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 65, 60, 60)) ,
                           
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              prefixIcon: const Icon(Icons.mail)),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please enter email";
                                }
                  
                              },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black) ,
                                 errorStyle:GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 65, 60, 60)) ,
                           
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              prefixIcon: const Icon(Icons.password)),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please enter password";
                                }
                  
                              },
                        ),
                          Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                         ;
                          
                          },
                          child: Text('Forgot Password?',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                    ),
                        SizedBox(
                          height: 20,
                        ),
                        RoundButton(title: "Login", onTap: (){
                          if(_formfield.currentState!.validate()){

                          }
                        })
              
                  ],
                ),
              )
              
             
            ],
           )
           
           
            );

           });

     }),
                SizedBox(
                  height: 20,
                ),
                RoundButton(title: 'Signup', 
     onTap: (){
         showModalBottomSheet(
          
            context: context,
           builder: (context){
            return Container(
           height: 650,
           decoration: BoxDecoration(
            color: Color.fromARGB(255, 211, 207, 207),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30) )
           ),
           child:Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text("Create Account",
               style:GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.black,),),
              SizedBox(
                height: 20,
                
              ),
              Form(
                 key: _formfield,

                child: Column(
                  children: [
                    TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black) ,
                                 errorStyle:GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 65, 60, 60)) ,
                           
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              prefixIcon: const Icon(Icons.mail)),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please enter email";
                                }
                  
                              },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black) ,
                                 errorStyle:GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 65, 60, 60)) ,
                           
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              prefixIcon: const Icon(Icons.password)),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please enter password";
                                }
                  
                              },
                        ),
                          Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                          onPressed: () {
                         ;
                          
                          },
                          child: Text('Already have an account login?',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                    ),
                        SizedBox(
                          height: 20,
                        ),
                        RoundButton(title: "Signup", onTap: (){
                          if(_formfield.currentState!.validate()){

                          }
                        })
              
                  ],
                ),
              )
              
             
            ],
           )
           
           
            );

           });

     }),
      
      ],
      ),
    );
  }
}
