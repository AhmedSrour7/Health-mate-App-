import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_mate/screens/core/login_screen.dart';
import 'package:health_mate/screens/core/sign_up_type_screen.dart';
import 'package:health_mate/widgets/button1.dart';
import 'package:health_mate/widgets/button2.dart';

class AuthTypePage extends StatelessWidget {
  const AuthTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Color(0xffE8F3F1),
        // statusBarColor: Color(0xffFCE36E).withOpacity(0.70),

        systemNavigationBarDividerColor:  Colors.black,
        systemNavigationBarColor: Colors.black,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness:
        Brightness.light, // For iOS (dark icons)// For iOS (dark icons)
      ),

      child: Scaffold(
        backgroundColor: Color(0xffE8F3F1),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset('assets/images/loggo.png'),
              SizedBox(height: 30,),
              Text("Let's get started!",
              style: TextStyle( color: Colors.black,
              fontSize: 25, fontWeight: FontWeight.bold),),
              Text("Login to enjoy the features we’ve\nprovided and stay healthy💪!",
              style: TextStyle(fontSize: 16,color: Colors.black54),
               textAlign: TextAlign.center, ),
               SizedBox(
                height: 40,
              ),
               button(text: "Login",onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                          return LoginPage();
                        }));
               },),
                  SizedBox(
                height: 20,
              ),
                button2(text: "Sign Up",onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SignUpTypePage();
                        }));
                },)
            ],
          ),
        ),
      ),
    );
  }
}