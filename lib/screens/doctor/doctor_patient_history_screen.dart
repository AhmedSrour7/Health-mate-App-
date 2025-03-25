import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/models/linearchart.dart';
import 'package:health_mate/widgets/charts.dart';
import '../../bloc/doctor/doctor_cubit.dart';
import '../../bloc/doctor/doctor_state.dart';

class DoctorPatientHistoryPage extends StatefulWidget {
  const DoctorPatientHistoryPage({super.key});

  @override
  State<DoctorPatientHistoryPage> createState() =>
      _DoctorPatientHistoryPageState();
}

class _DoctorPatientHistoryPageState extends State<DoctorPatientHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        DoctorCubit cubit = DoctorCubit.get(context);

        return Scaffold(
            backgroundColor: Color(0xffE8F3F1),
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
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                'Patient History',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              elevation: 0,
            ),
            body: ListView.separated(
                itemBuilder: (context, index) => ConditionalBuilder(
                      condition: cubit.userModel!.history!.isNotEmpty,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              "Date : ${cubit.userModel?.history![index].measureDate!.substring(0, 10) ?? ""}",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 400,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 9,
                                    offset: Offset(0, 3),
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Charts(
                                            ecgPoints: getecgPoints(cubit
                                                .userModel
                                                ?.history?[index]
                                                .ecg))),
                                    Text(
                                      'temperature: ${cubit.userModel?.history?[index].temperature ?? ""}\noxygen: ${cubit.userModel?.history?[index].oxygen ?? ""}\nheartRate: ${cubit.userModel?.history?[index].heartRate ?? ""}',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xff808080),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      fallback: (context) =>
                          Center(child: Text("No patient found")),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: cubit.userModel!.history!.length));
      },
    );
  }
}
