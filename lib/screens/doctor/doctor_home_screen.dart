import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/widgets/patient_card.dart';

import '../../bloc/doctor/doctor_cubit.dart';
import '../../bloc/doctor/doctor_state.dart';

class DoctorHomePage extends StatefulWidget {
  DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        DoctorCubit cubit = DoctorCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Patients',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          backgroundColor: Color(0XFF88D2C4),
          body: Column(children: [
            // searchBar(),
            SizedBox(
              height: 8,
            ),
            cubit.allPatientModel != null
                ? cubit.allPatientModel!.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: cubit.allPatientModel!.length,
                itemBuilder: (context, index) {
                  return card(
                    patientEmail: "${cubit.allPatientModel![index].email}",
                      name: "${cubit.allPatientModel![index].firstName} ${cubit.allPatientModel![index].lastName}",
                      condition: "${cubit.allPatientModel![index].userName}",
                      image: "${cubit.allPatientModel![index].pictureUrl}");
                },
              ),
            )
                : Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Center(
                      child: Text("No Patients Found",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),),
                    )))
                : Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Center(child: CircularProgressIndicator()),
                ))

          ]),
        );
      },
    );
  }
}
