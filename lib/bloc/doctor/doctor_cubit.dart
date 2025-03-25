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

import '../../models/all_patient_model.dart';
import '../../models/doctor_model.dart';
import '../../models/message_model.dart';
import 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  static DoctorCubit get(context) => BlocProvider.of(context);
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
  DoctorModel? doctorModel;
  Future<void> getDoctorInfo() async {

    String ?currentFCMToken = await FirebaseMessaging.instance.getToken();
    print(currentFCMToken);
    emit(DoctorGetInfoLoadingState());
    DioHelper.putData(url: "Account/AddDeviceToken",token: token,queryParameters: {
      "deviceToken":currentFCMToken.toString()
    }).then(((value){
      emit(DoctorGetInfoSuccessState());
    })).catchError((error){

      print(error.toString());
      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(DoctorGetInfoErrorState(error: errorMessage));
    });    DioHelper.getData(url: "Account/GetCurrentUser", token: token).then((value) {
      doctorModel = DoctorModel.fromJson(value.data);
      if (kDebugMode) {
        print(value.data);

      }
      emit(DoctorGetInfoSuccessState());
    }).catchError((error) {
      print(error.toString());

      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(DoctorGetInfoErrorState(error: errorMessage));
    });
  }

  List<AllPatientModel>? allPatientModel;

  void getAllPatient() {
    emit(DoctorGetAllPatientLoadingState());
    DioHelper.getData(url: "Doctor/GetAllPatients", token: token).then((value) {
      allPatientModel = [];
      value.data.forEach((patient) {
        allPatientModel?.add(AllPatientModel.fromJson(patient));
      });
      if (kDebugMode) {
        print(allPatientModel);
      }
      emit(DoctorGetAllPatientSuccessState());
    }).catchError((error) {
      print(error.toString());
      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(DoctorGetAllPatientErrorState(error: errorMessage));
    });
  }
UserModel ?userModel;
  void getPatientDetails({required String ?patientEmail}) {
    emit(DoctorGetPatientDetailsLoadingState());
    DioHelper.getData(url: "Doctor/GetPatientData", token: token,queryParameters: {
      "PatientEmail":patientEmail,
    }).then((value) {

      if (kDebugMode) {
        print(value.data);
      }
      userModel = UserModel.fromJson(value.data);
      emit(DoctorGetPatientDetailsSuccessState());
    }).catchError((error) {
      print(error.toString());
      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(DoctorGetPatientDetailsErrorState(error: errorMessage));
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
      senderId: doctorModel!.email,
      reciverId: receiverId,
      dateTime: dateTime,
    );
    FirebaseFirestore.instance.collection('users').doc(doctorModel!.email).collection('chats').doc(receiverId).collection('messages').add(model.toMap()).then((value) {
      emit(SocialSendMessageSuccessState());

    }).catchError((error){
      print(error.toString());

      emit(SocialSendMessageErrorState());
    });

    FirebaseFirestore.instance.collection('users').doc(receiverId).collection('chats').doc(doctorModel!.email).collection('messages').add(model.toMap()).then((value) {
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
    FirebaseFirestore.instance.collection('users').doc(doctorModel!.email).collection('chats').doc(receiverId).collection('messages').orderBy('dateTime').snapshots().listen((event) {
      messages=[];

      event.docs.forEach((element) {
        print(element.data());
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(SocialGetMessageSuccessState());
    });

  }
  /// Pick Profile Image and  uploadImage
    /// image picker
    /// upload profile image
    var picker = ImagePicker();
    File ?profileImage;
  void pickProfileImage() async {
    emit(DoctorPickedProfilePhotoLoadingState());
    final response = await picker.pickImage(source: ImageSource.gallery);
    if (response != null) {
      profileImage = File(response.path);
      emit(DoctorPickedProfilePhotoSuccessState());
    }
    else {
      print('No image selected');
      emit(DoctorPickedProfilePhotoErrorState());
    }
  }

  void uploadImage() async {
    emit(DoctorUploadProfilePhotoLoadingState());
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

      emit(DoctorUploadProfilePhotoSuccessState());
      getDoctorInfo();
      profileImage = null;
    }).catchError((error) {
      print(error.toString());
      emit(DoctorUploadProfilePhotoErrorState());
    });
  }

}
