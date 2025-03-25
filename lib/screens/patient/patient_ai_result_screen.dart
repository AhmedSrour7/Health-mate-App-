import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/widgets/custom_text_form_field.dart';


import '../../bloc/patient/user_cubit.dart';
import '../../bloc/patient/user_state.dart';
import '../../widgets/button1.dart';

class PatientAiResultPage extends StatefulWidget {
  const PatientAiResultPage({super.key});

  @override
  State<PatientAiResultPage> createState() => _PatientAiResultPageState();
}

class _PatientAiResultPageState extends State<PatientAiResultPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    UserCubit cubit = UserCubit.get(context);

    return Scaffold(
      backgroundColor: Color(0xffE8F3F1),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor:  Color(0xffE8F3F1),
          // statusBarColor: Color(0xffFCE36E).withOpacity(0.70),

          systemNavigationBarDividerColor:  Colors.black,
          systemNavigationBarColor: Colors.black,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness:
          Brightness.light, // For iOS (dark icons)// For iOS (dark icons)
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Advice', 
        style: TextStyle(color: Colors.black),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text('please tell me what do you feel?', style: TextStyle(fontSize: 20),),
              ),
              CustomTextFormField(
                controller: cubit.modelController,
                maxLines: 10,
              ),
              SizedBox(height: 10,),
              state is UserModelInfoLoadingState?Center(child: CircularProgressIndicator()):button(text: "Predict",onTap: (){
               cubit.getModelInfo();
              },),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Text('I think you might have:', style: TextStyle(fontSize: 20),),
              ),
              Container(
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), 
                      spreadRadius: 2, 
                      blurRadius: 9, 
                      offset: Offset(0, 3),)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text('You have :\ndescription: ${cubit.modelRobot?.description??""}\ndiets: ${cubit.modelRobot?.diets??""}\ndisease: ${cubit.modelRobot?.disease??""}\nmedications: ${cubit.modelRobot?.medications??""}\nprecautions: ${cubit.modelRobot?.precautions??""}\nworkout: ${cubit.modelRobot?.workout??""}',
                  style: TextStyle(fontSize: 17, color: Color(0xff808080),fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  },
);
  }
}