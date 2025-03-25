/// abstract class
abstract class SignUpState {}
////////////////////////////////////////////////////////////////////////////////
/// initial state
class SignUpInitial extends SignUpState {}
////////////////////////////////////////////////////////////////////////////////
/// Sign Up state
class SignUpLoadingState extends SignUpState {}
class SignUpSuccessState extends SignUpState {
  /// response from api
  String token;
  SignUpSuccessState({required this.token});
}
class SignUpErrorState extends SignUpState {
  /// error msg from api
  String error;
  SignUpErrorState({required this.error});
}
////////////////////////////////////////////////////////////////////////////////
/// change eye state
class SignUpChangePasswordEye extends SignUpState {}
////////////////////////////////////////////////////////////////////////////////
/// remember me state
class SignUpChangeRememberMe extends SignUpState {}