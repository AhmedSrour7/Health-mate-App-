import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/patient/user_cubit.dart';
import '../../bloc/patient/user_state.dart';
import '../../main.dart';
import '../../models/message_model.dart';
import '../../models/user_model.dart';


class PatientDoctorChatDetailsPage extends StatelessWidget {
  Doctor? userModel;
  var messageController = TextEditingController();

  PatientDoctorChatDetailsPage({
    this.userModel,
  });

  var ScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        UserCubit.get(context).getMessage(receiverId: userModel!.email!);
        return BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is SocialSendMessageSuccessState) {
              messageController.clear();
            }

          },
          builder: (context, state) {
            return Scaffold(
                key: ScaffoldKey,
                appBar: AppBar(
                  leading: IconButton(
                    onPressed: () {
                      UserCubit.get(context).messages=[];

                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,size: 18,),
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
                      }, icon: Icon(Icons.call))
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
                            UserCubit.get(context).messages[index];
                            if (UserCubit.get(context).userModel!.email ==
                                message.senderId) {
                              return buildMyMessage(message);
                            }
                            return buildMessage(message);
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 15,
                          ),
                          itemCount: UserCubit.get(context).messages.length,
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
                                // registerUser();
                                UserCubit.get(context).sendMessage(
                                    receiverId: userModel!.email!,
                                    dateTime: DateTime.now().toString(),
                                    text: messageController.text);
                                sendFCMMessage(FCMToken: userModel?.deviceToken??"",title: "${UserCubit.get(context).userModel!.firstName} ${UserCubit.get(context).userModel!.lastName}",body:messageController.text);

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