import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/screens/core/login_screen.dart';
import '../../bloc/observer/observer_cubit.dart';
import '../../bloc/observer/observer_state.dart';
import '../../constant/constant.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../helper/cache helper.dart';
import '../../main.dart';
import '../core/auth_type_screen.dart';

class ObserverProfilePage extends StatelessWidget {
  const ObserverProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ObserverCubit, ObserverState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ObserverCubit cubit=ObserverCubit.get(context);
        return Scaffold(
          appBar:AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Profile',style: TextStyle(color: Colors.white),),
          ) ,
          backgroundColor: Color(0xff199A8E),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  if (state is ObserverUploadProfilePhotoLoadingState)
                    LinearProgressIndicator(),
                  if (state is ObserverUploadProfilePhotoLoadingState)
                    const SizedBox(
                      height: 10,
                    ),
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(backgroundColor: Colors.grey[300], backgroundImage: cubit.profileImage!= null ? FileImage(cubit.profileImage!) as ImageProvider:cubit.observerModel?.pictureUrl != null ? NetworkImage(cubit.observerModel!.pictureUrl.toString()) : const NetworkImage("https://student.valuxapps.com/storage/assets/defaults/user.jpg"), radius: 75,),
                        CircleAvatar(
                          radius: 20,
                          child: IconButton(
                            onPressed: () {
                              cubit.pickProfileImage();
                            },
                            icon:  Icon(Icons.camera_alt_outlined),
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
                  SizedBox(height: 5,),
                  Text("${cubit.observerModel?.firstName??""} ${cubit.observerModel?.lastName??""}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                  SizedBox(height: 20,),
                  Container(
                    height: MediaQuery.of(context).size.height*3/4,

                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        color: Color(0xffE8F3F1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        )
                    ),
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
                              Expanded(child: CustomTextFormField(
                                enabled: false,

                                controller: TextEditingController(),hintText: cubit.observerModel?.email??"",labelText: "Email",radius: 15,borderColor:  Color(0xff199A8E),))
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
                              Expanded(child: CustomTextFormField(
                                enabled: false,

                                controller: TextEditingController(),hintText: cubit.observerModel?.userName??"",labelText: "Username",radius: 15,borderColor:  Color(0xff199A8E),))
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
                              Expanded(child: CustomTextFormField(
                                enabled: false,

                                controller: TextEditingController(),hintText: cubit.observerModel?.phoneNumber??"",labelText: "Phone",radius: 15,borderColor:  Color(0xff199A8E),))
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [

                              Image(

                                image: AssetImage('assets/images/Place Marker.png'),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(child: CustomTextFormField(
                                enabled: false,

                                controller: TextEditingController(),hintText:"${cubit.observerModel?.address?.country??""} ${cubit.observerModel?.address?.city??""} ${cubit.observerModel?.address?.region??""} ${cubit.observerModel?.address?.street??""}",labelText: "Address",radius: 15,borderColor:  Color(0xff199A8E),))
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
                          child:  Text("Logout",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red
                              )),
                        ),


                      ],
                    ),
                  )
                  ,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}