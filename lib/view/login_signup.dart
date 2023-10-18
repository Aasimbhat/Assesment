import 'package:assignment_syoft/utlis/utlis.dart';
import 'package:assignment_syoft/view/dashboard.dart';
import 'package:assignment_syoft/view/forgot_password.dart';
import 'package:assignment_syoft/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lottie/lottie.dart';

class LoginSignUpPage extends StatefulWidget {
  const LoginSignUpPage({super.key});

  @override
  State<LoginSignUpPage> createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signinController = TextEditingController();
  final passinController = TextEditingController();
  final phoneController = TextEditingController();
  final _formfield = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    signinController.dispose();
    passinController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Lottie.asset('asset/Animation4.json'),
          Text(
            "Welcome To Syoft",
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Text(
            "We are pleased to have you here",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RoundButton(
              title: 'Login',
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                          height: height * .65,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 254, 254),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
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
                                          hintStyle: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          errorStyle: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 65, 60, 60)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          prefixIcon: const Icon(Icons.mail)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter email";
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          hintStyle: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          errorStyle: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 65, 60, 60)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          prefixIcon:
                                              const Icon(Icons.password)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter password";
                                        }
                                      },
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        const forgotPassword())));
                                          },
                                          child: Text('Forgot Password?',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black))),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    RoundButton(
                                        loading: loading,
                                        title: "Login",
                                        onTap: () {
                                          if (_formfield.currentState!
                                              .validate()) {
                                                setState(() {
                                                loading = true;
                                              });
                                            _auth
                                                .signInWithEmailAndPassword(
                                                    email: emailController.text
                                                        .toString(),
                                                    password: passwordController
                                                        .text
                                                        .toString())
                                                .then((value) {
                                              Utlis().toastMessage(
                                                  "Welcome to the dashboard");
                                                    setState(() {
                                                loading = true;
                                              });
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          const DashBoard())));
                                              
                                            }).onError((error, stackTrace) {
                                              setState(() {
                                                loading = false;
                                              });
                                              Utlis().toastMessage(
                                                  error.toString());
                                            });
                                          }
                                        })
                                  ],
                                ),
                              )
                            ],
                          ));
                    });
              }),
          const SizedBox(
            height: 20,
          ),
          RoundButton(
              title: 'Signup',
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                          height: height *8,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Create Account",
                                style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Form(
                                key: _formfield,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: signinController,
                                      decoration: InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          errorStyle: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 65, 60, 60)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          prefixIcon: const Icon(Icons.mail)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter email";
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: passinController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          hintStyle: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          errorStyle: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 65, 60, 60)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          prefixIcon:
                                              const Icon(Icons.password)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter password";
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    IntlPhoneField(
                                      controller: phoneController,
                                      decoration: InputDecoration(
                                          hintText: 'Phone Number',
                                          hintStyle: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          errorStyle: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(
                                                  255, 65, 60, 60)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          prefixIcon:
                                              const Icon(Icons.password)),
                                      validator: (value) {
                                        if (value == null) {
                                          return "Please enter phone number";
                                        }
                                      },
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: TextButton(
                                          onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        const LoginSignUpPage())));
                                          },
                                          child: Text(
                                              'Already have an account login?',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black))),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    RoundButton(
                                        title: "Signup",
                                        loading: loading,
                                        onTap: () {
                                          if (_formfield.currentState!
                                              .validate()) {
                                                setState(() {
                                                loading = true;
                                              });

                                            _auth
                                                .createUserWithEmailAndPassword(
                                                    email: signinController.text
                                                        .toString(),
                                                    password: passinController
                                                        .text
                                                        .toString())
                                                .then((value) {
                                              Utlis().toastMessage(
                                                  "Signup Sucessfull");
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          const LoginSignUpPage())));
                                              setState(() {
                                                loading = true;
                                              });
                                            }).onError((error, stackTrace) {
                                              setState(() {
                                                loading = false;
                                              });
                                              Utlis().toastMessage(
                                                  error.toString());
                                            });
                                          }
                                        })
                                  ],
                                ),
                              )
                            ],
                          ));
                    });
              }),
        ],
      ),
    );
  }
}
