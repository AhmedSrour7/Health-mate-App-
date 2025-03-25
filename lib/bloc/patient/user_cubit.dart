import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/constant.dart';
import '../../helper/dio_helper.dart';
import '../../helper/exceptions.dart';
import '../../models/Pharmacy_model.dart';
import '../../models/hospitals_model.dart';
import '../../models/message_model.dart';
import '../../models/model_Robot.dart';
import '../../models/user_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);
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

  /// Get User Info
  UserModel? userModel;
  Future<void> getUserInfo() async {
    String? currentFCMToken = await FirebaseMessaging.instance.getToken();
    print(currentFCMToken);
    emit(UserGetInfoLoadingState());
    DioHelper.putData(
            url: "Account/AddDeviceToken",
            token: token,
            queryParameters: {"deviceToken": currentFCMToken.toString()})
        .then(((value) {
      emit(UserGetInfoSuccessState());
    })).catchError((error) {
      print(error.toString());
      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(UserGetInfoErrorState(error: errorMessage));
    });

    await DioHelper.getData(url: "Account/GetCurrentUser", token: token)
        .then((value) {
      userModel = UserModel.fromJson(value.data);
      if (kDebugMode) {
        print(userModel!.email);
      }
      emit(UserGetInfoSuccessState());
    }).catchError((error) {
      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(UserGetInfoErrorState(error: errorMessage));
    });
  }

  //
  ///////////////////////////////////////////////////////////////////////////////
  ModelRobot? modelRobot;
  void getModelInfo() {
    emit(UserModelInfoLoadingState());
    Dio().post("https://ai-model-e0g9.onrender.com/predict",
        data: {"symptoms": modelController.text}).then((value) {
      if (kDebugMode) {
        print(value.data);
      }
      modelRobot = ModelRobot.fromJson(value.data);
      ;
      emit(UserModelInfoSuccessState());
    }).catchError((error) {
      print(error.toString());

      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(UserModelInfoErrorState(error: errorMessage));
    });
  }

  //////////////////////////////////////////////////////////////////////////////
  HospitalModel? hospitalModel;
  void getHospitalAddresses({String? name}) {
    hospitalModel = null;
    emit(UserGetHospitalAddressesLoadingState());
    DioHelper.getData(url: "Service", token: token, queryParameters: {
      "type": "H",
      "name": name,
    }).then((value) {
      hospitalModel = HospitalModel.fromJson(value.data);
      if (kDebugMode) {
        print(value.data);
      }
      emit(UserGetHospitalAddressesSuccessState());
    }).catchError((error) {
      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(UserGetHospitalAddressesErrorState(error: errorMessage));
    });
  }

  /////////////////////////////////////////////////////////////////////////////
  PharmacyModel? pharmacyModel;

  void getPharmacyAddresses({String? name}) {
    pharmacyModel = null;

    emit(UserGetPharmacyAddressesLoadingState());
    DioHelper.getData(url: "Service", token: token, queryParameters: {
      "type": "P",
      "name": name,
    }).then((value) {
      pharmacyModel = PharmacyModel.fromJson(value.data);
      if (kDebugMode) {
        print(value.data);
      }
      emit(UserGetPharmacyAddressesSuccessState());
    }).catchError((error) {
      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(UserGetPharmacyAddressesErrorState(error: errorMessage));
    });
  }

  // ///////////////////////////////////////////////////////////////////////////////
  /// Send message
  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
      text: text,
      senderId: userModel!.email,
      reciverId: receiverId,
      dateTime: dateTime,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.email)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((error) {
      print(error.toString());

      emit(SocialSendMessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel!.email)
        .collection('messages')
        .add(model.toMap())
        .then(
      (value) {
        emit(SocialSendMessageSuccessState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(SocialSendMessageErrorState());
    });
  }

////////////////////////////////////////////////////////////////////////////////
  ///Get message
  var messageController = TextEditingController();
  List<MessageModel> messages = [];
  void getMessage({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.email)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];

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
  File? profileImage;

  /// Pick Profile Image and  uploadImage
  void pickProfileImage() async {
    emit(UserPickedProfilePhotoLoadingState());
    final response = await picker.pickImage(source: ImageSource.gallery);
    if (response != null) {
      profileImage = File(response.path);
      emit(UserPickedProfilePhotoSuccessState());
    } else {
      print('No image selected');
      emit(UserPickedProfilePhotoErrorState());
    }
  }

  void uploadImage() async {
    emit(UserUploadProfilePhotoLoadingState());
    String fileName = profileImage!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image":
          await MultipartFile.fromFile(profileImage!.path, filename: fileName),
    });
    DioHelper.putData(
            url: "Account/UpdateImage", formData: formData, token: token)
        .then((value) {
      emit(UserUploadProfilePhotoSuccessState());
      getUserInfo();
      profileImage = null;
    }).catchError((error) {
      print(error.toString());
      emit(UserUploadProfilePhotoErrorState());
    });
  }
}
