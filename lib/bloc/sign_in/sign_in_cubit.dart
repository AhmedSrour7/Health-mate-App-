import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_mate/bloc/sign_in/sign_in_state.dart';

import '../../helper/dio_helper.dart';
import '../../helper/exceptions.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  static SignInCubit get(context) => BlocProvider.of(context);
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
  bool rememberMe=true;
  /// signIn
  void signIn() {
    emit(SignInLoadingState());
    DioHelper.postData(url:'Account/login', data: {
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) {
      if (kDebugMode) {
        print(value.data);
      }
      emit(SignInSuccessState(token:value.data['token'],type:value.data['role'] ));
    }).catchError((error) {
      final errorMessage = DioExceptions.fromDioError(error).toString();
      print(errorMessage);
      emit(SignInErrorState(error: errorMessage));
    });
  }

////////////////////////////////////////////////////////////////////////////////
  /// change password eye
  void changeEye() {
    eye = !eye;
    emit(SignInChangePasswordEye());
  }
  //////////////////////////////////////////////////////////////////////////////
  /// change password eye
  void rememberMeMeChange() {
    rememberMe = !rememberMe;
    emit(SignInChangeRememberMe());
  }
  //////////////////////////////////////////////////////////////////////////////
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
