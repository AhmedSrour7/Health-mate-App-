import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/models/linearchart.dart';
import 'package:health_mate/screens/observer/observer_patient_history_screen.dart';
import 'package:health_mate/screens/observer/observer_patient_profile_screen.dart';
import 'package:health_mate/widgets/charts.dart';
import 'package:health_mate/widgets/measure_card.dart';

import '../../bloc/observer/observer_cubit.dart';
import '../../bloc/observer/observer_state.dart';

class ObserverPatientMeasurePage extends StatefulWidget {
  ObserverPatientMeasurePage({super.key});

  @override
  State<ObserverPatientMeasurePage> createState() =>
      _ObserverPatientMeasurePageState();
}

class _ObserverPatientMeasurePageState
    extends State<ObserverPatientMeasurePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ObserverCubit, ObserverState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ObserverCubit cubit = ObserverCubit.get(context);
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
                        builder: (context) => ObserverPatientHistoryPage()),
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
                                              ObserverPatientProfilePage(),
                                        ));
                                  },
                                  child: CircleAvatar(
                                    radius: 80,
                                    backgroundImage: NetworkImage(
                                        cubit.userModel!.pictureUrl!),
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
