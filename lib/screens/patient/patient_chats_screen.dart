import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/patient/user_cubit.dart';
import '../../bloc/patient/user_state.dart';
import 'patient_doctor_chat_details_screen.dart';
import 'patient_observer_chat_details_screen.dart';

class PatientChatsPage extends StatefulWidget {
  const PatientChatsPage({super.key});

  @override
  State<PatientChatsPage> createState() => _PatientChatsPageState();
}

class _PatientChatsPageState extends State<PatientChatsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        UserCubit cubit = UserCubit.get(context);

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            // Status bar color
             statusBarColor: Color(0xffE8F3F1),
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
            backgroundColor: Color(0xffE8F3F1),
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Text(
                      'Messages',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Search",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.search),
                        ],
                      ),
                    ),
                  ),
                  cubit.userModel != null
                      ? Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20,right: 10,left: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 25),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                  bottomRight: Radius.circular(35),
                                  bottomLeft: Radius.circular(35),

                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                // Text(
                                // "My Chats",
                                // style: TextStyle(
                                //   fontSize: 17,
                                //   fontWeight: FontWeight.bold,
                                // ),),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PatientObserverChatDetailsPage(
                                                userModel:
                                                    cubit.userModel?.observer,
                                              ),
                                            ));
                                      },
                                      child: Container(
                                        height: 65,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 28,
                                              backgroundImage: NetworkImage(cubit
                                                      .userModel
                                                      ?.observer
                                                      ?.pictureUrl ??
                                                  'https://w7.pngwing.com/pngs/337/569/png-transparent-social-media-imo-social-media-icon-thumbnail.png'),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${cubit.userModel?.observer?.firstName ?? ""} ${cubit.userModel?.observer?.lastName ?? ""}",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "(observer 👱‍♂️)",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   height: 0.5,
                                  //   width: double.infinity,
                                  //   color: Colors.grey,
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PatientDoctorChatDetailsPage(
                                                userModel:
                                                    cubit.userModel?.doctor,
                                              ),
                                            ));
                                      },
                                      child: Container(
                                        height: 65,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 28,
                                              backgroundImage: NetworkImage(cubit
                                                      .userModel
                                                      ?.doctor
                                                      ?.pictureUrl ??
                                                  'https://w7.pngwing.com/pngs/337/569/png-transparent-social-media-imo-social-media-icon-thumbnail.png'),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${cubit.userModel?.doctor?.firstName ?? ""} ${cubit.userModel?.doctor?.lastName ?? ""}",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "(Doctor 🧑‍⚕️)",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
