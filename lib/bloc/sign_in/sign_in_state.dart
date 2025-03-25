/// abstract class
abstract class SignInState {}
////////////////////////////////////////////////////////////////////////////////
/// initial state
class SignInInitial extends SignInState {}
////////////////////////////////////////////////////////////////////////////////
/// Sign In state
class SignInLoadingState extends SignInState {}
class SignInSuccessState extends SignInState {
  /// response from api
  String token;
  String type;

  SignInSuccessState({required this.token,required this.type});
}
class SignInErrorState extends SignInState {
  /// error msg from api
  String error;
  SignInErrorState({required this.error});
}
////////////////////////////////////////////////////////////////////////////////
/// change eye state
class SignInChangePasswordEye extends SignInState {}
////////////////////////////////////////////////////////////////////////////////
/// remember me state
class SignInChangeRememberMe extends SignInState {}