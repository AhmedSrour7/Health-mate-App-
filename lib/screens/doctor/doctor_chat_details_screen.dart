import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/doctor/doctor_cubit.dart';
import '../../bloc/doctor/doctor_state.dart';
import '../../main.dart';
import '../../models/all_patient_model.dart';
import '../../models/message_model.dart';


class DoctorChatDetailsPage extends StatelessWidget {
  AllPatientModel? userModel;
  var messageController = TextEditingController();

  DoctorChatDetailsPage({
    this.userModel,
  });

  var ScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        DoctorCubit.get(context).getMessage(receiverId: userModel!.email!);
        return BlocConsumer<DoctorCubit, DoctorState>(
          listener: (context, state) {
            if (state is SocialGetMessageSuccessState) {
              messageController.clear();
            }

          },
          builder: (context, state) {
            return Scaffold(
                key: ScaffoldKey,
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      DoctorCubit.get(context).messages=[];
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined,
                        color: Colors.black),
                  ),
                  backgroundColor: Colors.white.withOpacity(0.4),
                  elevation: 0.0,
                  titleSpacing: 0.0,
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(userModel?.pictureUrl??'https://w7.pngwing.com/pngs/337/569/png-transparent-social-media-imo-social-media-icon-thumbnail.png'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '${userModel!.firstName} ${userModel!.lastName}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                      Spacer(),
                      IconButton(onPressed: (){
                        call(userModel!.phoneNumber!);
                      }, icon: Icon(Icons.call),),


                    ],
                  ),
                ),
                body: ConditionalBuilder(
                  condition: true,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            var message =
                            DoctorCubit.get(context).messages[index];
                            if (DoctorCubit.get(context).doctorModel!.email ==
                                message.senderId) {
                              return buildMyMessage(message);
                            }
                            return buildMessage(message);
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                          itemCount: DoctorCubit.get(context).messages.length,
                          physics: const BouncingScrollPhysics(),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: messageController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'type your message here ...',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: MaterialButton(
                              onPressed: () {


                                DoctorCubit.get(context).sendMessage(
                                    receiverId: userModel!.email!,
                                    dateTime: DateTime.now().toString(),
                                    text: messageController.text);

                                sendFCMMessage(FCMToken: userModel?.deviceToken??"",title: "${DoctorCubit.get(context).doctorModel!.firstName} ${DoctorCubit.get(context).doctorModel!.lastName}",body:messageController.text);

                              },
                              minWidth: 1.0,
                              child: const Icon(
                                Icons.send,
                                size: 22.0,
                                color: Color(0XFF199A8E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
                ));
          },
        );
      },
    );
  }

  Widget buildMessage(MessageModel model) => Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(

        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
          color: Color(0XFFE1E1E2),
          borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              topStart: Radius.circular(10),
              topEnd: Radius.circular(10)),
        ),
        child:  Column(
            children:[

              if(model.text!=null)
                Text(
                  '${model.text}',
                  style: const TextStyle(color: Colors.black,fontSize:16),
                ),
            ]
        ),
      )
  );

  Widget buildMyMessage(MessageModel model) => Align(
      alignment: AlignmentDirectional.centerEnd,
      child:Container(

        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: const BoxDecoration(
          color: Color(0XFF199A8E),
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(15),
              topStart: Radius.circular(15),
              topEnd: Radius.circular(15)),
        ),
        child:  Column(
            children:[

              if(model.text!=null)
                Text(
                  '${model.text}',
                  style: const TextStyle(color: Colors.white,fontSize: 16),
                ),
            ]
        ),
      )
  );
}