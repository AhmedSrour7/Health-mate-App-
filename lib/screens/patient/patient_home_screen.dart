// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/models/linearchart.dart';
import 'package:health_mate/screens/patient/patient_profile_screen.dart';
import 'package:health_mate/widgets/charts.dart';
import 'package:health_mate/widgets/measure_card.dart';
import '../../bloc/patient/user_cubit.dart';
import '../../bloc/patient/user_state.dart';
import '../../main.dart';

class PatientHomePage extends StatelessWidget {
  PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        UserCubit cubit = UserCubit.get(context);

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Color(0XFFDCEEEB),
            // statusBarColor: Color(0xffFCE36E).withOpacity(0.70),

            systemNavigationBarDividerColor: Colors.black,
            systemNavigationBarColor: Colors.black,

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness:
                Brightness.light, // For iOS (dark icons)// For iOS (dark icons)
          ),
          child: Scaffold(
            backgroundColor: Color(0XFFDCEEEB),
            body: state is UserGetInfoSuccessState
                ? SafeArea(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return PatientProfilePage();
                                          },
                                        ),
                                      );
                                    },
                                    icon: CircleAvatar(
                                      radius: 23,
                                      backgroundColor: Color(0XFFDCEEEB),
                                      backgroundImage: NetworkImage(
                                          cubit.userModel?.pictureUrl! ?? ""),
                                    ),
                                  ),
                                  Text(
                                    'Welcome ${cubit.userModel?.firstName ?? ""}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                call("123");
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Image(
                                    image:
                                        AssetImage("assets/images/Siren.png")),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Color(0XFFAE98BB),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 120,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Your Heath Is Important\nTo Us ...!',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -25,
                                right: -30,
                                child: Image.asset(
                                  'assets/images/doctor.png',
                                  height: 160,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0XFF88D2C4),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: MeasurementCardPatient(
                                            title: 'Heart Rate',
                                            data: cubit.userModel?.history?[0]
                                                    .heartRate
                                                    .toString() ??
                                                "",
                                            image:
                                                'assets/images/Heart with Pulse.png'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          child: Charts(
                                              ecgPoints: getecgPoints(cubit
                                                  .userModel
                                                  ?.history?[0]
                                                  .ecg))),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: MeasurementCardPatient(
                                            title: 'Body Temperature',
                                            data: cubit.userModel?.history?[1]
                                                    .temperature
                                                    .toString() ??
                                                "",
                                            image:
                                                'assets/images/Thermometer.png'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: MeasurementCardPatient(
                                            title: 'Blood O2',
                                            data: cubit.userModel?.history?[0]
                                                    .oxygen
                                                    .toString()
                                                    .substring(0, 2) ??
                                                "",
                                            image: 'assets/images/Oxygen.png'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
