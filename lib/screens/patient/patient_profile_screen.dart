import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/widgets/custom_text_form_field.dart';
import 'package:health_mate/screens/patient/patient_observer_profile_screen.dart';
import '../../bloc/patient/user_cubit.dart';
import '../../bloc/patient/user_state.dart';
import '../../constant/constant.dart';
import '../../helper/cache helper.dart';
import '../../main.dart';
import '../core/auth_type_screen.dart';
import 'patient_doctor_profile_screen.dart';

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        UserCubit cubit = UserCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle:  SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Color(0xff199A8E),
          // statusBarColor: Color(0xffFCE36E).withOpacity(0.70),

          systemNavigationBarDividerColor: Colors.black,
          systemNavigationBarColor: Colors.black,

          // Status bar brightness (optional)
          statusBarIconBrightness:
          Brightness.dark, // For Android (dark icons)
          statusBarBrightness:
          Brightness.light, // For iOS (dark icons)// For iOS (dark icons)
        ),

            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return PatientObserverProfilePage();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.visibility)
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return PatientDoctorProfilePage();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.assignment_ind)
              ),
            ],
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Color(0xff199A8E),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (state is UserUploadProfilePhotoLoadingState)
                    LinearProgressIndicator(),
                  if (state is UserUploadProfilePhotoLoadingState)
                    const SizedBox(
                      height: 10,
                    ),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(backgroundColor: Colors.grey[300], backgroundImage: cubit.profileImage!= null ? FileImage(cubit.profileImage!) as ImageProvider:cubit.userModel?.pictureUrl != null ? NetworkImage(cubit.userModel!.pictureUrl.toString()) : const NetworkImage("https://student.valuxapps.com/storage/assets/defaults/user.jpg"), radius: 75,),
                        CircleAvatar(
                          radius: 20,
                          child: IconButton(
                            onPressed: () {
                              cubit.pickProfileImage();
                            },
                            icon: Icon(Icons.camera_alt_outlined),
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  if (cubit.profileImage!= null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: MaterialButton(
                        onPressed: () {
                          cubit.uploadImage();
                        },
                        child: Text(
                          "upload",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("${cubit.userModel?.firstName??""} ${cubit.userModel?.lastName??""}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*3/4,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Color(0xffE8F3F1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
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
                                    hintText: cubit.userModel?.email ?? "",
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
                                    hintText: cubit.userModel?.userName ?? "",
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
                                    hintText: cubit.userModel?.phoneNumber ?? "",
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

                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            CacheHelper.removerData(key: "token")
                                .then((value) async {
                              token = null;
                              type= null;
                              CacheHelper.removerData(key: "type")
                                  .then((value) async {
                                token = null;
                                type= null;
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyApp(

                                        startScreen: AuthTypePage()),
                                  ),
                                      (route) => false,
                                );

                              });
                            });
                          },
                          child: Text("Logout",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red
                              )),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
      },
    );
  }
}
