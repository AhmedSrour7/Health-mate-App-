import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/widgets/custom_text_form_field.dart';
import '../../bloc/patient/user_cubit.dart';
import '../../bloc/patient/user_state.dart';

class PatientDoctorProfilePage extends StatelessWidget {
  const PatientDoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        UserCubit cubit = UserCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Color(0xff199A8E),
              // statusBarColor: Color(0xffFCE36E).withOpacity(0.70),

              systemNavigationBarDividerColor: Colors.black,
              systemNavigationBarColor: Colors.black,

              // Status bar brightness (optional)
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness
                  .light, // For iOS (dark icons)// For iOS (dark icons)
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Doctor',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Color(0xff199A8E),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 1,
                            color: Colors.grey.shade600)
                      ]),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        NetworkImage(cubit.userModel!.doctor!.pictureUrl!),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  cubit.userModel?.doctor?.firstName ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffE8F3F1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/images/Email.png'),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: CustomTextFormField(
                                    enabled: false,

                                    controller: TextEditingController(),
                                hintText: cubit.userModel?.doctor?.email ?? "",
                                labelText: "Email",
                                radius: 15,
                                borderColor: Color(0xff199A8E),
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              Image(
                                width: 40,
                                height: 40,
                                image: AssetImage(
                                    'assets/images/photo-removebg-preview.png'),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: CustomTextFormField(
                                    enabled: false,

                                    controller: TextEditingController(),
                                hintText:
                                    cubit.userModel?.doctor?.userName ?? "",
                                labelText: "Username",
                                radius: 15,
                                borderColor: Color(0xff199A8E),
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage('assets/images/Phone.png'),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: CustomTextFormField(
                                    enabled: false,

                                    controller: TextEditingController(),
                                hintText:
                                    cubit.userModel?.doctor?.phoneNumber ?? "",
                                labelText: "Phone",
                                radius: 15,
                                borderColor: Color(0xff199A8E),
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/Place Marker.png'),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: CustomTextFormField(
                                    enabled: false,

                                    controller: TextEditingController(),
                                hintText:
                                    "${cubit.userModel?.address?.country ?? ""} ${cubit.userModel?.address?.city ?? ""} ${cubit.userModel?.address?.region ?? ""} ${cubit.userModel?.address?.street ?? ""}",
                                labelText: "Address",
                                radius: 15,
                                borderColor: Color(0xff199A8E),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
