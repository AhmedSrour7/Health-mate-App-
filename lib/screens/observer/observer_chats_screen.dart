import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/observer/observer_cubit.dart';
import '../../bloc/observer/observer_state.dart';
import 'observer_chat_details_screen.dart';

class ObserverChatsPage extends StatefulWidget {
  const ObserverChatsPage({super.key});

  @override
  State<ObserverChatsPage> createState() => _ObserverChatsPageState();
}

class _ObserverChatsPageState extends State<ObserverChatsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ObserverCubit, ObserverState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    ObserverCubit cubit=ObserverCubit.get(context);
    return Scaffold(
      backgroundColor: Color(0xffDCEEEB),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Text(
              'Messages',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // searchBar(),
          cubit.userModel != null
              ? Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                padding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),

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
                        vertical: 5,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ObserverChatDetailsPage(
                                      userModel:
                                      cubit.userModel,
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
                                    ?.pictureUrl ??
                                    'https://w7.pngwing.com/pngs/337/569/png-transparent-social-media-imo-social-media-icon-thumbnail.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${cubit.userModel?.firstName ?? ""} ${cubit.userModel?.lastName ?? ""}",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
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
                  ],
                ),
              )
            ],
          )
              : Container()
       
        ],
      ),
    );
  },
);
  }
}
