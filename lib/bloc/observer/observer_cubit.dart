import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/models/user_model.dart';
import 'package:image_picker/image_picker.dart';


import '../../constant/constant.dart';
import '../../helper/dio_helper.dart';
import '../../helper/exceptions.dart';

import '../../models/message_model.dart';
import '../../models/observer_model.dart';
import 'observer_state.dart';

class ObserverCubit extends Cubit<ObserverState> {
  ObserverCubit() : super(ObserverInitial());
  static ObserverCubit get(context) => BlocProvider.of(context);
  //////////////////////////////////////////////////////////////////////////////
  /// My Profile TexFormFields
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  //////////////////////////////////////////////////////////////////////////////
  /// Change password TexFormFields
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
////////////////////////////////////////////////////////////////////////////////
  TextEditingController modelController = TextEditingController();

  /// Get Doctor Info
  ObserverModel? observerModel;
  Future<void> getObserverInfo() async {

    String ?currentFCMToken = await FirebaseMessaging.instance.getToken();
    print(currentFCMToken);
    emit(ObserverGetInfoLoadingState());
    DioHelper.putData(url: "Account/AddDeviceToken",token: token,queryParameters: {
      "deviceToken":currentFCMToken.toString()
    }).then(((value){
      emit(ObserverGetInfoSuccessState());
    })).catchError((error){

      print(error.toString());
      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(ObserverGetInfoErrorState(error: errorMessage));
    });
    DioHelper.getData(url: "Account/GetCurrentUser", token: token).then((value) {
      observerModel = ObserverModel.fromJson(value.data);
      if (kDebugMode) {
        print(value.data);

      }
      emit(ObserverGetInfoSuccessState());
    }).catchError((error) {
      print(error.toString());

      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(ObserverGetInfoErrorState(error: errorMessage));
    });
  }


UserModel ?userModel;
  void getPatientDetails() {
    emit(ObserverGetPatientDetailsLoadingState());
    DioHelper.getData(url: "Observer/GetPatientData", token: token).then((value) {
      if (kDebugMode) {
        print(value.data);
      }
      userModel = UserModel.fromJson(value.data);
      emit(ObserverGetPatientDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(ObserverGetPatientDetailsErrorState(error: errorMessage));
    });
  }


  //////////////////////////////////////////////////////////////////////////////
  /// Send message
  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,

  })
  {
    MessageModel model=MessageModel(
      text: text,
      senderId: observerModel!.email,
      reciverId: receiverId,
      dateTime: dateTime,
    );
    FirebaseFirestore.instance.collection('users').doc(observerModel!.email).collection('chats').doc(receiverId).collection('messages').add(model.toMap()).then((value) {
      emit(SocialSendMessageSuccessState());

    }).catchError((error){
      print(error.toString());

      emit(SocialSendMessageErrorState());
    });

    FirebaseFirestore.instance.collection('users').doc(receiverId).collection('chats').doc(observerModel!.email).collection('messages').add(model.toMap()).then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SocialSendMessageErrorState());
    });
  }
////////////////////////////////////////////////////////////////////////////////
  ///Get message
  var messageController=TextEditingController();
  List<MessageModel>messages=[];
  void getMessage({
    required String receiverId,
  })
  {
    FirebaseFirestore.instance.collection('users').doc(observerModel!.email).collection('chats').doc(receiverId).collection('messages').orderBy('dateTime').snapshots().listen((event) {
      messages=[];

      event.docs.forEach((element) {
        print(element.data());
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(SocialGetMessageSuccessState());
    });

  }


  ////////////////////////////////////////////////////////////////////////////////
  /// image picker
  /// upload profile image
  var picker = ImagePicker();
  File ?profileImage;

  /// Pick Profile Image and  uploadImage
  void pickProfileImage() async {
    emit(ObserverPickedProfilePhotoLoadingState());
    final response = await picker.pickImage(source: ImageSource.gallery);
    if (response != null) {
      profileImage = File(response.path);
      emit(ObserverPickedProfilePhotoSuccessState());
    }
    else {
      print('No image selected');
      emit(ObserverPickedProfilePhotoErrorState());
    }
  }
  void uploadImage() async {
    emit(ObserverUploadProfilePhotoLoadingState());
    String fileName = profileImage!
        .path
        .split('/')
        .last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
          profileImage!.path, filename: fileName),
    });
    DioHelper.putData(url: "Account/UpdateImage",
        formData: formData,
        token: token).then((value) {

      emit(ObserverUploadProfilePhotoSuccessState());
      getObserverInfo();
      profileImage = null;
    }).catchError((error) {
      print(error.toString());
      emit(ObserverUploadProfilePhotoErrorState());
    });
  }




}
