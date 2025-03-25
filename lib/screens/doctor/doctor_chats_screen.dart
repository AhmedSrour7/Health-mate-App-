import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/doctor/doctor_cubit.dart';
import '../../bloc/doctor/doctor_state.dart';
import 'doctor_chat_details_screen.dart';

class DoctorChatsPage extends StatefulWidget {
  const DoctorChatsPage({super.key});

  @override
  State<DoctorChatsPage> createState() => _DoctorChatsPageState();
}

class _DoctorChatsPageState extends State<DoctorChatsPage> {
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

          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 25),
                  child: Text(
                    'Messages',
                    style: TextStyle(
                      fontSize: 28,
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
            
                cubit.allPatientModel != null
                    ? cubit.allPatientModel!.isNotEmpty
                    ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: cubit.allPatientModel!.length,
                    itemBuilder: (context, index) {
                      return  Container(
                        margin: EdgeInsets.only(top: 20,right: 10,left:10),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35),
                            bottomLeft: Radius.circular(35),

                            topRight: Radius.circular(35),
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
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorChatDetailsPage(
                                    userModel: cubit.allPatientModel?[index],
                                  ),));
            
                                },
                                child: Container(
                                  height: 65,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(cubit.allPatientModel?[index].pictureUrl??'https://w7.pngwing.com/pngs/337/569/png-transparent-social-media-imo-social-media-icon-thumbnail.png'),
                                      ),
                                      SizedBox(width: 10,),

                                      Text(
                                        "${cubit.allPatientModel?[index].firstName??""} ${cubit.allPatientModel?[index].lastName??""}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
            
                          ],
                        ),
                      );
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
              ],
            ),
          ),
        );
      },
    );
  }
}
