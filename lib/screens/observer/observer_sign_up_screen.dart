import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/widgets/button1.dart';
import 'package:health_mate/widgets/textFeild.dart';
import '../../bloc/sign_up/sign_up_cubit.dart';
import '../../bloc/sign_up/sign_up_state.dart';
import '../../widgets/custom_toast.dart';
import '../core/login_screen.dart';


class ObserverSignUpPage extends StatefulWidget {
  const ObserverSignUpPage({super.key});

  @override
  State<ObserverSignUpPage> createState() => _ObserverSignUpPageState();
}

class _ObserverSignUpPageState extends State<ObserverSignUpPage> {
  bool maleSelected = false;
  bool femaleSelected = false;

  String? firstName,
      lastName,
      email,
      password,
      confirmPassword,
      phoneNumber,
      age,
      country,
      region,
      city,
      birth,
      street;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is SignUpSuccessState) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
            ToastManager.CustomToastSuccess(
                context: context,
                title: "Created Successfully",
                description: "Your account created successfully");
          }
          if (state is SignUpErrorState) {
            ToastManager.CustomToastError(
                context: context,
                title: "Sign up failed",
                description: state.error);
          }
        },
        builder: (context, state) {
          SignUpCubit cubit = SignUpCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                // Status bar color
                statusBarColor:Color(0xffE8F3F1),
                // statusBarColor: Color(0xffFCE36E).withOpacity(0.70),

                systemNavigationBarDividerColor:  Colors.black,
                systemNavigationBarColor: Colors.black,

                // Status bar brightness (optional)
                statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
                statusBarBrightness:
                Brightness.light, // For iOS (dark icons)// For iOS (dark icons)
              ),

              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Sign Up',
                style: TextStyle(color: Colors.black),
              ),
            ),
            backgroundColor: Color(0xffE8F3F1),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        height: 50,
                        child: intext(
                          onchanged: (data) {
                            firstName = data;
                          },
                          text: "Enter your first name",
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        height: 50,
                        child: intext(
                          onchanged: (data) {
                            lastName = data;
                          },
                          text: "Enter your last name",
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        height: 50,
                        child: intext(
                          onchanged: (data) {
                            email = data;
                          },
                          text: "Enter your Email",
                          icon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        height: 50,
                        child: pass(
                          onChanged: (data) {
                            password = data;
                          },
                          text: "Enter your Password",
                          icon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        height: 50,
                        child: pass(
                          onChanged: (data) {
                            confirmPassword = data;
                          },
                          text: "Confirm your Password",
                          icon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        height: 50,
                        child: intext(
                          onchanged: (data) {
                            phoneNumber = data;
                          },
                          text: "Enter your phone number",
                          icon: Icon(Icons.add_call),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color(0xff8c8c8c),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  offset: Offset(3, 3))
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.apartment,
                                  color: Color(0xff8c8c8c),
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                Text(
                                  "Address",
                                  style: TextStyle(
                                      color: Color(0xff8c8c8c), fontSize: 18),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 30,
                              width: 320,
                              child: TextField(
                                onChanged: (data) {
                                  country = data;
                                },
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xffd9dada),
                                    hintText: "Country"),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                height: 30,
                                width: 320,
                                child: TextField(
                                  onChanged: (data) {
                                    region = data;
                                  },
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffd9dada),
                                      hintText: "Region"),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                height: 30,
                                width: 320,
                                child: TextField(
                                  onChanged: (data) {
                                    city = data;
                                  },
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffd9dada),
                                      hintText: "City"),
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                height: 30,
                                width: 320,
                                child: TextField(
                                    onChanged: (data) {
                                      street = data;
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xffd9dada),
                                        hintText: "Street"))),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    ConditionalBuilder(condition: state is SignUpLoadingState, builder: (context) => Center(child: CircularProgressIndicator()), fallback: (context) =>  button(
                      text: "Sign Up",

                      onTap: () async {
                        cubit.signUp(
                            firstName: firstName??"",
                            lastName: lastName??"",
                            email: email??"",
                            password: password??"",
                            confirmpass: confirmPassword??"",
                            phoneNumber: phoneNumber??"",
                            age: age??"",
                            city: city??"",
                            country: country??"",
                            region: region??"",
                            street: street??"",
                            gender: maleSelected ? "male" : "female",
                            birth: birth??"",
                            url: "Doctor/Register"
                        );
                      },
                    ),),

                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}