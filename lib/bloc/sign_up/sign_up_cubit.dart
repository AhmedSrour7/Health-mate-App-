import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/bloc/sign_up/sign_up_state.dart';
import '../../helper/dio_helper.dart';
import '../../helper/exceptions.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
////////////////////////////////////////////////////////////////////////////////
  /// SignIn TextFormFields
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
////////////////////////////////////////////////////////////////////////////////
  /// SignIn form key
  var formKey = GlobalKey<FormState>();
////////////////////////////////////////////////////////////////////////////////
  /// SignIn password eye
  bool eye = true;
  /////////////////////////////////////////////////////////////////////////////
  bool rememberMe = true;
////////////////////////////////////////////////////////////////////////////////

  /// signUp
  void signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmpass,
    required String phoneNumber,
    required String age,
    required String country,
    required String region,
    required String city,
    required String street,
    required String gender,
    required String birth,
    required String url,

  }) {
    emit(SignUpLoadingState());
    print(firstName);
    print(lastName);
    print(email);
    print(password);
    print(confirmpass);
    print(phoneNumber);
    print(age);
    print(country);
    print(region);
    print(city);
    print(street);
    print(gender);
    print(birth);

    DioHelper.postData(url:url, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "bloodType": "AB",
      "bod": birth,
      "gender": gender,
      "hardwareId": "E308CD0FE266",
      "address": {
        "street": street,
        "region": region,
        "city": city,
        "country": country,
        "hardwareId": "E308CD0FE266",

      },
    }).then((value) {
      if (kDebugMode) {
        print(value.data);
      }
      emit(SignUpSuccessState(token: value.data['token']));
    }).catchError((error) {
      print(error.toString());

      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(SignUpErrorState(error: errorMessage));
    });
  }

////////////////////////////////////////////////////////////////////////////////
  /// change password eye
  void changeEye() {
    eye = !eye;
    emit(SignUpChangePasswordEye());
  }

  //////////////////////////////////////////////////////////////////////////////
  /// change password eye
  void rememberMeMeChange() {
    rememberMe = !rememberMe;
    emit(SignUpChangeRememberMe());
  }

  //////////////////////////////////////////////////////////////////////////////
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
