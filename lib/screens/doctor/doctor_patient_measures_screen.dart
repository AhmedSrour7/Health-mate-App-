import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/models/linearchart.dart';
import 'package:health_mate/screens/doctor/doctor_patient_history_screen.dart';
import 'package:health_mate/screens/doctor/doctor_patient_profile_screen.dart';
import 'package:health_mate/widgets/charts.dart';
import 'package:health_mate/widgets/measure_card.dart';

import '../../bloc/doctor/doctor_cubit.dart';
import '../../bloc/doctor/doctor_state.dart';

class DoctorPatientMeasurePage extends StatefulWidget {
  DoctorPatientMeasurePage({super.key});

  @override
  State<DoctorPatientMeasurePage> createState() =>
      _DoctorPatientMeasurePageState();
}

class _DoctorPatientMeasurePageState extends State<DoctorPatientMeasurePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
      
      },
      builder: (context, state) {
        DoctorCubit cubit = DoctorCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0XFFDCEEEB),
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Color(0XFFDCEEEB),
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Patient Records',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DoctorPatientHistoryPage()),
                  );
                },
                icon: Icon(
                  Icons.history,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConditionalBuilder(
                condition: cubit.userModel != null,
                builder: (context) => cubit.userModel!.history!.isNotEmpty
                    ? Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0XFF88D2C4),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DoctorPatientProfilePage(),
                                        ));
                                  },
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage: NetworkImage(
                                        cubit.userModel?.pictureUrl ?? ""),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${cubit.userModel?.firstName ?? ""} ${cubit.userModel?.lastName ?? ""}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
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
                                            data: cubit.userModel?.history?[0]
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
                      )
                    : Expanded(child: Center(child: Text('No patient found'))),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              )
              // Pages.elementAt(sIndex),
            ],
          ),
        );
      },
    );
  }
}
