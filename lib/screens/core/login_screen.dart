import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/screens/core/sign_up_type_screen.dart';
import 'package:health_mate/widgets/button1.dart';
import 'package:health_mate/screens/patient/patient_bottom_navigation_bar_screen.dart';

import '../../bloc/sign_in/sign_in_cubit.dart';
import '../../bloc/sign_in/sign_in_state.dart';
import '../../constant/constant.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../helper/cache helper.dart';
import '../../widgets/custom_toast.dart';
import '../doctor/doctor_bottom_navigation_bar_screen.dart';
import '../observer/observer_bottom_navigation_bar_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is SignInSuccessState) {
            token = state.token;
            CacheHelper.putData(key: "token", value: token!).then((value) {});
            if (state.type == "Patient") {
              CacheHelper.putData(key: "type", value: "patient").then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientBottomNavigationBarPage()),
                  (route) => false,
                );
              });
            } else if (state.type == "Doctor") {
              CacheHelper.putData(key: "type", value: "doctor").then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoctorBottomNavigationBarPage()),
                  (route) => false,
                );
              });
            } else {
              CacheHelper.putData(key: "type", value: "observer").then((value) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ObserverBottomNavigationBarPage()),
                  (route) => false,
                );
              });
            }
          }
          if (state is SignInErrorState) {
            ToastManager.CustomToastError(
                context: context,
                title: "Sign in failed",
                description: state.error);
          }
        },
        builder: (context, state) {
          SignInCubit cubit = SignInCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Color(0xffE8F3F1),
                // statusBarColor: Color(0xffFCE36E).withOpacity(0.70),

                systemNavigationBarDividerColor: Colors.black,
                systemNavigationBarColor: Colors.black,

                // Status bar brightness (optional)
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness
                    .light, // For iOS (dark icons)// For iOS (dark icons)
              ),
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
            ),
            backgroundColor: const Color(0xffE8F3F1),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/loggo.png',
                          height: 200,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                            hintText: "Enter Your Email",
                            controller: cubit.emailController,
                            labelText: "Email",
                            validator: (value) {
                              // using regular expression
                              if (!RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$').hasMatch(value!))
                              {
                                return "please enter valid email";
                              } else if (value.isEmpty) {
                                return "please enter your email";
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Icons.email),
                        CustomTextFormField(
                            hintText: "Enter Your Password",
                            controller: cubit.passwordController,
                            labelText: "Password",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please enter your password";
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Icons.lock),
                        SizedBox(
                          height: 10,
                        ),
                        state is SignInLoadingState
                            ? Center(child: CircularProgressIndicator())
                            : button(
                                text: "Login",
                                onTap: () {
                                  if(cubit.formKey.currentState!.validate())
                                  cubit.signIn();
                                },
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'I don\'t have an account ?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SignUpTypePage();
                                    },
                                  ),
                                );
                              },
                              child: const Text(
                                ' Sign Up',
                                style: TextStyle(
                                  color: Color(0xff199A8E),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                         text: 'Don’t have an account? ',
//                         style: TextStyle(color: Colors.black, fontSize: 20)),
//                     TextSpan(
//                         text: ' Sign Up',
//                         style: TextStyle(
//                             color: Color(0xff199A8E),
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold)),
//                   ],
//                 ),
//               ),
