// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment_syoft/models/demo_data_model.dart';
import 'package:assignment_syoft/view/login_signup.dart';
import 'package:assignment_syoft/widgets/dot_indicator.dart';
import 'package:assignment_syoft/widgets/onBoarding_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}


class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex=0;
  @override
  void initState() {
    _pageController=PageController(initialPage: 0);


    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(''),
           TextButton(
            onPressed: (){
       Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginSignUpPage())));


            },
            child: Text("Skip",
        style:  
             GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.black,),
        textAlign: TextAlign.right,)),
          ],
        )
        
        
      ),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: demo_data.length,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex=index;
                    });
                    
                  },
                  itemBuilder: (context,index){
                  return  onboardingContent(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,
                );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(left:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   ...List.generate(demo_data.length,(index)=>Padding(
                     padding: const EdgeInsets.only(right: 4),
                     child: DotIndicator(isActive: index==_pageIndex),
                   )),
                   Container(
                  margin:const EdgeInsets.only(left: 300,bottom: 40),
                   child: FloatingActionButton(
                    backgroundColor: Colors.deepPurple,
                         onPressed: (){
                           _pageController.nextPage(duration:const Duration(milliseconds: 300), curve: Curves.ease);
                         },
                         child:Icon(Icons.arrow_forward_outlined) ,
                         ),
                 ),
                  ],
                ),
              )
               
            ],
          ),
        )
      ),
    );
  }
}






